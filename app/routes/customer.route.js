module.exports = (app) => {
  const {
    validateCustomerInfo,
    addNewCustomer,
    authenticateCustomer,
    generateToken,
    verifyCustomerToken,
    createNewCart,
  } = require("../middleware/customer.middleware");

  app.post("/register", validateCustomerInfo, addNewCustomer);

  app.post("/login", authenticateCustomer, generateToken, (req, res) => {
    res.json({
      token: req.token,
      refreshToken: req.refreshToken,
    });
  });
};
