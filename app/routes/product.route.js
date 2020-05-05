module.exports = (app) => {
  const {
    getAllProduct,
    getProductsByPage,
    getProductById,
  } = require("../middleware/product.middleware");

  app.get("/products", getAllProduct);
  app.get("/products/page/:page", getProductsByPage);
  app.get("/products/id/:id", getProductById);
};
