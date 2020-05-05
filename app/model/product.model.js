const { connection, query } = require("./db");

function selectAllProduct() {
  return new Promise((res, rej) => {
    const sql = `SELECT * FROM product`;
    query(sql)
      .then((result) => res(result.recordset))
      .catch((err) => rej(err));
  });
}

function selectNumberOfProduct() {
  return new Promise((res, rej) => {
    const sql = `SELECT MAX(product_no) as number FROM product`;
    query(sql)
      .then((result) => res(result.recordset))
      .catch((err) => rej(err));
  });
}

function selectProductsByPage(page) {
  return new Promise(async (res, rej) => {
    try {
      const lastProductIndex = await selectNumberOfProduct();
      const maxPage = Math.ceil(lastProductIndex[0].number / 16);
      const startAt = page <= 0 || page > maxPage ? 1 : (page - 1) * 16 + 1;

      const sql = `SELECT * FROM product
                   WHERE product_no BETWEEN ${startAt} AND ${startAt + 15}`;

      const result = await query(sql);
      res({ products: result.recordset, maxPage });
    } catch (err) {
      rej(err);
    }
  });
}

function selectProductById(id) {
  return new Promise((res, rej) => {
    const sql = `SELECT * FROM product WHERE id = ${id}`;
    query(sql)
      .then((result) => res(result.recordset))
      .catch((err) => rej(err));
  });
}

module.exports = {
  selectAllProduct,
  selectProductsByPage,
  selectProductById,
  selectNumberOfProduct,
};
