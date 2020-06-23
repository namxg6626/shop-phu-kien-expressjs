const { insertNewBill, insertItems } = require("../model/bill.model");
const randomString = require("randomstring");

async function createNewCart(req, res, next) {
  const idCustomer = req.idCustomer;
  const total = req.body.total;
  req.idBill = randomString.generate({
    length: 12,
    charset: "alphabetic",
  });

  try {
    await insertNewBill(req.idBill, idCustomer, total);
    next();
  } catch (err) {
    console.error(err);
    return res.json({
      status: 500,
      message: "internal server error (in createNewCart middleware)",
    });
  }
}

async function addItems(req, res, next) {
  const items = req.body.items;
  try {
    await insertItems(req.idBill, items);
    next();
  } catch (err) {
    console.log(err);
    return res.json({
      status: 500,
      message: "internal server error (in addItems middleware)",
    });
  }
}

module.exports = {
  createNewCart,
  addItems,
};
