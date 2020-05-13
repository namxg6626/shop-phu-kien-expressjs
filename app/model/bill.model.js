const { query } = require("./db");

function selectTheLastBill() {
  return new Promise((res, rej) => {
    const sql = "SELECT MAX(id) as lastId FROM bill";
    query(sql)
      .then((result) => res(result.recordset[0].lastId))
      .catch((err) => rej(err));
  });
}

function insertNewBill(idBill, idCustomer, total) {
  return new Promise((res, rej) => {
    let date = new Date();
    date = date.toISOString().slice(0, 10);
    const sql = `INSERT INTO bill (id, id_customer, total, create_at) VALUES
                 ('${idBill}', ${idCustomer}, ${total}, '${date}')`;
    query(sql)
      .then((result) => res(result))
      .catch((err) => rej(err));
  });
}

function insertItems(idBill, items) {
  return new Promise((res, rej) => {
    let sql =
      "INSERT INTO bill_item (id_bill, id_product, quantity, unit_price) VALUES ";
    for (let i = 0; i < items.length; i++) {
      const item = items[i];
      sql += `('${idBill}', ${item.id}, ${item.quantity}, ${item.price})`;
      if (i < items.length - 1) sql += ",";
    }
    query(sql)
      .then((result) => res(result))
      .catch((err) => rej(err));
  });
}

module.exports = {
  insertNewBill,
  insertItems,
  selectTheLastBill,
};
