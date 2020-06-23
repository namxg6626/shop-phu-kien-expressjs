const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const {
  findOneByEmail,
  insertNewCustomer,
} = require("../model/customer.model");
require("dotenv").config();

async function validateCustomerInfo(req, res, next) {
  const { email, password, phoneNumber } = req.body;

  const regexPhoneNumber = /^[\d]{10,11}$/;
  const regexEmail = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
  const regexPassword = /^[\w\d]{4,}$/;

  const isCorrectPhoneNumber = regexPhoneNumber.test(phoneNumber);
  const isCorrectEmail = regexEmail.test(email);
  const isCorrectPassword = regexPassword.test(password);

  if (isCorrectPhoneNumber && isCorrectEmail && isCorrectPassword) next();
  else
    return res.status(400).json({
      status: 400,
      message: "invalid form",
    }); // bad request
}

async function addNewCustomer(req, res, next) {
  const { email, password, phoneNumber } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);

  try {
    const isExistingEmail = await findOneByEmail(email);
    if (isExistingEmail.length !== 0)
      return res.status(400).json({
        status: 400,
        message: "this email has existed",
      });

    await insertNewCustomer(phoneNumber, email, hashedPassword);
    return res.status(201).json({
      status: 201,
      message: "registered",
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      status: 500,
      message: "internal server error",
    });
  }
}

async function authenticateCustomer(req, res, next) {
  const result = await findOneByEmail(req.body.email);
  const customerInfo = result[0];

  if (!customerInfo)
    return res.status(404).json({
      status: 404,
      message: "no user with this email",
    });

  const isCorrectPassword = await bcrypt.compare(
    req.body.password,
    customerInfo.password
  );
  if (!isCorrectPassword)
    return res.status(403).json({
      status: 403,
      message: "incorrect password",
    });

  req.customerInfo = customerInfo;
  next();
}

function generateToken(req, res, next) {
  const customerInfo = req.customerInfo;

  const token = jwt.sign(
    { id: customerInfo.id },
    process.env.ACCESS_TOKEN_SECRET,
    {
      expiresIn: "2h",
    }
  );

  const refreshToken = jwt.sign(
    { id: customerInfo.id },
    process.env.REFRESH_TOKEN_SECRET,
    {
      expiresIn: "1d",
    }
  );

  req.token = token;
  req.refreshToken = refreshToken;
  next();
}

function verifyCustomerToken(req, res, next) {
  const { token, refreshToken } = req.body;
  try {
    const { id } = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET);
    req.idCustomer = id;
    next();
  } catch (err) {
    return res.status(403).json({
      status: 403,
      message: "token expired",
    });
  }
}

function refreshCustomerToken(req, res, next) {
  const refreshToken = req.body.refreshToken;
  try {
    req.customerInfo = jwt.verify(
      refreshToken,
      process.env.REFRESH_TOKEN_SECRET
    );
    next();
  } catch (error) {
    res.status(403).json({
      status: 403,
      message: "refresh token expired",
    });
  }
}

function sendToken(req, res, next) {
  res.json({
    token: req.token,
    refreshToken: req.refreshToken,
  });
  next();
}

module.exports = {
  validateCustomerInfo,
  addNewCustomer,
  authenticateCustomer,
  generateToken,
  verifyCustomerToken,
  refreshCustomerToken,
  sendToken,
};
