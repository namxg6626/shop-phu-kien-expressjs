module.exports = (app) => {
  const { verifyCustomerToken } = require("../middleware/customer.middleware");
  const { createNewCart, addItems } = require("../middleware/bill.middleware");
  app.post(
    "/create-cart",
    verifyCustomerToken,
    createNewCart,
    addItems,
    (req, res) => {
      res.json({
        status: 201,
        message: "created",
      });
    }
  );
};
