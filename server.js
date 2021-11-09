const dotenv = require("dotenv");
dotenv.config();
const cors = require("cors");
const fileUpload = require("express-fileupload");
var express = require("express"),
  app = express(),
  port = process.env.APP_PORT,
  bodyParser = require("body-parser");
app.use(
  fileUpload({
    createParentPath: true,
  })
);
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// LOAD MIDDLEWARE OAUTH
// var middleware = require("./app/middleware/middleware");
// app.use(async function (req, res, next) {
//   if (
//     req.originalUrl == "/api/login/user" ||
//     (req.originalUrl == "/api/configuration" && req.method == "GET")
//   ) {
//     next();
//     return;
//   }
//   let check_token = await middleware.check_token(req, res);
//   let create_log = true;
//   if (check_token && req.method != "GET") {
//     create_log = await middleware.create_log(req, res);
//   }
//   if (check_token && create_log) {
//     next();
//     return;
//   }
// });
// END MIDDLEWARE OAUTH

var routes = require("./app/routes");
routes(app);

app.listen(port);
console.log(`${process.env.APP_NAME} started on port: ${port}`);
