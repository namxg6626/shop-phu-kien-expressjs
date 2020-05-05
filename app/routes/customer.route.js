module.exports = (app) => {
  const {
    validateCustomerInfo,
    addNewCustomer,
    authenticateCustomer,
    generateToken,
  } = require("../middleware/customer.middleware");

  app.post("/register", validateCustomerInfo, addNewCustomer);

  app.post("/login", authenticateCustomer, generateToken, (req, res) => {
    res.cookie("token", "a", {
      maxAge: 900000,
    });
    console.log(req.token);
    // cookie()
  });
};
