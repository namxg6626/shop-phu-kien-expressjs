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

function selectTheLastBill() {
  return new Promise((res, rej) => {
    const sql = "SELECT MAX(id) as lastId FROM bill";
    query(sql)
      .then((result) => res(result))
      .catch((err) => rej(err));
  });
}

(async () => {
  console.log(await selectTheLastBill());
})();

module.exports = {
  connection,
  request,
  query,
};
