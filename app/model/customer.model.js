const { query } = require("./db");

function findOneByEmail(email) {
  return new Promise((res, rej) => {
    const sql = `SELECT id, email, phone_number, password FROM customer
                 WHERE email LIKE '${email}'`;
    query(sql)
      .then((result) => res(result.recordset))
      .catch((err) => rej(err));
  });
}

function insertNewCustomer(phoneNumber, email, password) {
  return new Promise((res, rej) => {
    const sql = `INSERT INTO customer (phone_number, email, password)
                 VALUES ('${phoneNumber}', '${email}', '${password}')`;
    query(sql)
      .then((result) => res(result.rowsAffected))
      .catch((err) => rej(err));
  });
}

function insertNewCart(id_customer, total, create_at) {
  return new Promise((res, rej) => {
    const date = new Date().toISOString().slice(0, 10);
    const sql = `INSERT INTO bill (id_customer, total, create_at)
                 VALUES ('${id_customer}', '${total}', '${create_at}')`;
    query(sql)
      .then((result) => res(result.rowsAffected))
      .catch((err) => rej(err));
  });
}

module.exports = {
  findOneByEmail,
  insertNewCustomer,
  insertNewCart,
};
