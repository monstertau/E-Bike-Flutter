/**
 * Module dependencies.
 */
const express = require("express");
const compression = require("compression");
const bodyParser = require("body-parser");
const logger = require("morgan");
const chalk = require("chalk");
const errorHandler = require("errorhandler");
const dotenv = require("dotenv");
const flash = require("express-flash");
const path = require("path");
const expressStatusMonitor = require("express-status-monitor");
const multer = require("multer");
const cors = require("cors");
const { HMACAuth } = require("./security/hmac");
/**
 * Load environment variables from .env file, where API keys and passwords are configured.
 */
if (process.env.NODE_ENV !== "production") {
  require("dotenv").config({ path: ".env" });
}
/**
 * Controllers (route handlers).
 */
const dockController = require("./controllers/dock.controller");
const bikeController = require("./controllers/bike.controller");
const cardController = require("./controllers/card.controller");
const paymentController = require("./controllers/payment.controller");
/**
 * Create Express server.
 */
const app = express();

/**
 * Connect to PostgreSQL.
 */

/**
 * Express configuration.
 */
app.set("host", process.env.HOST || "0.0.0.0");
app.set("port", process.env.PORT || 8080);
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "pug");

// CORS
const corsOptions = {
  credentials: true,
  origin: "*",
  optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
};
app.use(cors(corsOptions));

app.use(expressStatusMonitor());
app.use(compression());
app.use(logger("dev"));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(flash());

app.use(
  "/",
  express.static(path.join(__dirname, "public"), { maxAge: 31557600000 })
);
app.use(
  "/js/lib",
  express.static(path.join(__dirname, "node_modules/chart.js/dist"), {
    maxAge: 31557600000,
  })
);
app.use(
  "/js/lib",
  express.static(path.join(__dirname, "node_modules/popper.js/dist/umd"), {
    maxAge: 31557600000,
  })
);
app.use(
  "/js/lib",
  express.static(path.join(__dirname, "node_modules/bootstrap/dist/js"), {
    maxAge: 31557600000,
  })
);
app.use(
  "/js/lib",
  express.static(path.join(__dirname, "node_modules/jquery/dist"), {
    maxAge: 31557600000,
  })
);
app.use(
  "/webfonts",
  express.static(
    path.join(__dirname, "node_modules/@fortawesome/fontawesome-free/webfonts"),
    { maxAge: 31557600000 }
  )
);

/**
 * Primary app routes.
 */
app.get("/test", dockController.test);
app.get("/dock/get-all", dockController.getAll);
app.get("/dock/get-detail", dockController.getDetail);
app.get("/bike/search",bikeController.search);
app.get("/card/check-locked",cardController.checkLock);
app.post("/payment/create",paymentController.createPayment);
app.post("/payment/search",paymentController.searchPayment);
app.post("/payment/update",paymentController.updatePayment);
/**
 * Error Handler.
 */
if (process.env.NODE_ENV === "development") {
  // only use in development
  app.use(errorHandler());
} else {
  app.use((err, req, res, next) => {
    console.error(err);
    res.status(500).send("Server Error");
  });
}

/**
 * Start Express server.
 */
app.listen(app.get("port"), () => {
  console.log(
    "%s App is running at http://%s:%d in %s mode",
    chalk.green("✓"),
    app.get("host"),
    app.get("port"),
    app.get("env")
  );
  console.log("  Press CTRL-C to stop\n");
});

module.exports = app;
