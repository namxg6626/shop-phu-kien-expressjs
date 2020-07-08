const {
  selectAllProduct,
  selectProductsByPage,
  selectProductById,
} = require("../model/product.model");

module.exports.getAllProduct = async (req, res, next) => {
  try {
    req.products = await selectAllProduct();
    res.json({
      status: 200,
      products: req.products,
    });
    next();
  } catch (err) {
    return res.json({
      status: 500,
      message: "internal server error",
    });
  }
};

module.exports.getProductsByPage = async (req, res, next) => {
  const page = req.params.page;
  const result = await selectProductsByPage(page);
  res.status(200).json({
    maxPage: result.maxPage,
    products: result.products,
  });
  next();
};

module.exports.getProductById = async (req, res, next) => {
  const id = req.params.id;
  const result = await selectProductById(id);
  res.status(200).json({
    product: result[0],
  });
  next();
};
