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

function createNewCustomer(phoneNumber, email, password) {
  return new Promise((res, rej) => {
    const sql = `INSERT INTO customer (phone_number, email, password)
                 VALUES ('${phoneNumber}', '${email}', '${password}')`;
    query(sql)
      .then((result) => res(result.rowsAffected))
      .catch((err) => rej(err));
  });
}

module.exports = {
  findOneByEmail,
  createNewCustomer,
};
