const express = require("express");
const cors = require("cors");
const app = express();
const cookieParser = require("cookie-parser");
const expSession = require("express-session");

app.use(express.json());
app.use(
  cors({
    origin: ["http://localhost:3000", "http://localhost:5000"],
    credentials: true,
  })
);

require("./app/routes/customer.route")(app);
require("./app/routes/product.route")(app);
require("./app/routes/bill.route")(app);

app.listen(8000);
