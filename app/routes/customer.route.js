module.exports = (app) => {
  const {
    validateCustomerInfo,
    addNewCustomer,
    authenticateCustomer,
    generateToken,
    refreshCustomerToken,
    sendToken,
  } = require("../middleware/customer.middleware");

  app.post("/register", validateCustomerInfo, addNewCustomer);

  app.post("/login", authenticateCustomer, generateToken, sendToken);

  app.post("/refresh-token", refreshCustomerToken, generateToken, sendToken);
};
