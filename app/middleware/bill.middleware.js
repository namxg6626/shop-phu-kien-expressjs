const {
  insertNewBill,
  insertItems,
  selectTheLastBill,
} = require("../model/bill.model");

async function createNewCart(req, res, next) {
  const idCustomer = req.idCustomer;
  const total = req.body.total;
  try {
    await insertNewBill(idCustomer, total);
    next();
  } catch (err) {
    console.error(err);
    return res.json({
      status: 500,
      message: "internal server error",
    });
  }
}

async function addItems(req, res, next) {
  const items = req.body.items;
  console.log(items);
  try {
    const lastBillId = await selectTheLastBill();
    if (lastBillId === null)
      return res({
        status: 400,
        message: "no cart existed",
      });
    await insertItems(lastBillId, items);
    next();
  } catch (err) {
    console.log(err);
    return res.json({
      status: 500,
      message: "internal server error",
    });
  }
}

module.exports = {
  createNewCart,
  addItems,
};
