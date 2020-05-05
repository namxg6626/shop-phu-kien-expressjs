const express = require("express");
const cors = require("cors");
const app = express();
const cookieParser = require("cookie-parser");

app.use(cookieParser());

app.use(express.json());
app.use(cors({ credentials: true, origin: "http://localhost:3000" }));

require("./app/routes/customer.route")(app);
require("./app/routes/product.route")(app);

app.listen(8000);
