const Connection = require("mssql/msnodesqlv8").ConnectionPool;
const Request = require("mssql/msnodesqlv8").Request;

const db_config = {
  server: "DESKTOP-MKTAIV1",
  user: "DESKTOP-MKTAIV1\\namxg",
  database: "shopnguyenxa",
  port: 1433,
  driver: "msnodesqlv8",
  options: {
    trustedConnection: true,
  },
};

const connection = new Connection(db_config);
const request = new Request(connection);

async function query(sql) {
  await connection.connect();
  const result = await request.query(sql);
  await connection.close();
  return result;
}

module.exports = {
  connection,
  request,
  query,
};

// const mysql = require("mysql");

// const connection = mysql.createConnection({
//   user: "root",
//   password: "",
//   host: "localhost",
//   port: "3306",
//   database: "shopnguyenxa",
// });

// function mySQLQuery(sql) {
//   return new Promise((res, rej) => {
//     connection.query(sql, (err, result) => {
//       if (err) rej(err);
//       else res(result);
//     });
//   });
// }

// module.exports = {
//   connection,
//   mySQLQuery,
// };
