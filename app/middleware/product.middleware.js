const {
  selectAllProduct,
  selectProductsByPage,
  selectProductById,
} = require("../model/product.model");

async function getAllProduct(req, res, next) {
  try {
    req.products = await selectAllProduct();
    res.json({
      status: 200,
      products: req.products,
    });
  } catch (err) {
    return res.json({
      status: 500,
      message: "internal server error",
    });
  }
  next();
}

async function getProductsByPage(req, res, next) {
  const page = req.params.page;
  const result = await selectProductsByPage(page);
  res.json({
    maxPage: result.maxPage,
    products: result.products,
  });
}

async function getProductById(req, res, next) {
  const id = req.params.id;
  const result = await selectProductById(id);
  res.json({
    product: result[0],
  });
}

module.exports = {
  getAllProduct,
  getProductsByPage,
  getProductById,
};
