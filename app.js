const express = require("express");
const mysql = require("mysql");
const cosr = require("cors");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
require("dotenv").config();

const app = express();
const con = mysql.createConnection({
  user: "root",
  password: "",
  host: "localhost",
  port: "3306",
  database: "shopnguyenxa",
});

app.listen(4000, () => console.log("listening on port 4000"));
app.use(cosr()); // enable cross-origin sharing resources
app.use(express.json());

const _SELECT_ALL = "SELECT * FROM product";
const _SELECT_BY_ID = "SELECT * FROM product WHERE id = ";

const tokenList = [];
const refreshTokenList = [];

app.get(`/`, (req, res) => {
  const { id, limit } = req.query;
  let sql;
  id ? (sql = _SELECT_BY_ID + id) : (sql = _SELECT_ALL);

  con.query(sql, (err, result) => {
    if (limit) result = result.slice(0, limit);
    res.json(result);
    if (err) console.log(err);
  });
});

app.get(`/page/:page`, (req, res) => {
  const { page } = req.params;
  let sql = _SELECT_ALL;

  con.query(sql, (err, result) => {
    const maxPage = Math.floor(result.length / 16);
    let startIndex;

    page > maxPage || page < 1
      ? (startIndex = 0)
      : (startIndex = (page - 1) * 16);

    const products = result.slice(startIndex, startIndex + 16);
    res.json({ products, maxPage });
  });
});

app.post("/register", validateUserInfo, addUser, (req, res) => {
  return res.sendStatus(200); // ok
});

app.post("/login", authenticateUser, sendToken);

// register phase
function validateUserInfo(req, res, next) {
  const { phoneNumber, email, password } = req.body;

  const regexPhoneNumber = /^[\d]{10,11}$/;
  const regexEmail = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
  const regexPassword = /^[\w\d]{4,}$/;

  const isCorrectPhoneNumber = regexPhoneNumber.test(phoneNumber);
  const isCorrectEmail = regexEmail.test(email);
  const isCorrectPassword = regexPassword.test(password);

  if (isCorrectPhoneNumber && isCorrectEmail && isCorrectPassword) next();
  else return res.sendStatus(400); // bad request
}

async function addUser(req, res, next) {
  const { phoneNumber, email, password } = req.body;

  const hashedPassword = await bcrypt.hash(password, 10);

  const sql = `INSERT INTO customer (phone_number, email, password)
               VALUES ('${phoneNumber}', '${email}', '${hashedPassword}')`;

  console.log(hashedPassword);

  // con.query(sql, (err, result) => {
  //   if (err) {
  //     console.error(err);
  //     return res.sendStatus(500); // internal server error
  //   } else next();
  // });
  next();
}

// login phase
async function authenticateUser(req, res, next) {
  const { email, password } = req.body;
  const sql = `SELECT email, password FROM customer WHERE email LIKE '${email}'`;
  let user;

  try {
    [user] = await mySQLQuery(sql);

    if (!user)
      return res.status(401).json({
        status: 401,
        message: "no user with this email",
      });

    const isCorrectPassword = await bcrypt.compare(password, user.password);
    if (!isCorrectPassword)
      return res.status(401).json({
        status: 401,
        message: "incorrect password",
      });
  } catch (err) {
    console.log(err);
    return res.status(500).json({
      status: 500,
      message: "internal server error",
    });
  }

  req.user = user;
  next();
}

function sendToken(req, res, next) {
  const { user } = req;
  const token = generateToken({ ...user });
  const refreshToken = generateRefreshToken({ ...user });
  return res.status(200).json({
    token,
    refreshToken,
  });
}

// other function
function mySQLQuery(sql) {
  return new Promise((res, rej) => {
    con.query(sql, (err, result) => {
      if (err) rej(err);
      else res(result);
    });
  });
}

function generateToken(data) {
  return jwt.sign(data, process.env.ACCESS_TOKEN_SECRET, {
    expiresIn: "20s",
  });
}

function generateRefreshToken(data) {
  return jwt.sign(data, process.env.REFRESH_TOKEN_SECRET, {
    expiresIn: "1d",
  });
}

// TEST
