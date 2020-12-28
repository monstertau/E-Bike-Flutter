const crypto = require("crypto");
const dotenv = require("dotenv");
dotenv.config({ path: ".env" });

exports.HMACAuth = (req, res, next) => {
  const method = req.method;
  const routeName = req.route.path;
  let body = "";
  let type = "";
  const authStr = req.headers.authorization;
  const encryptedPK = crypto
    .createHash("sha1")
    .update(process.env.PUBLIC_KEY)
    .digest("hex");
  const encryptedSK = crypto
    .createHash("sha1")
    .update(process.env.PRIVATE_KEY)
    .digest("hex");

  if (!authStr) {
    return res.status(403).json({
      success: false,
      error: "missing_authorization_header",
    });
  }
  const arr = authStr.split(" ");

  const ident = arr[0].trim();
  console.log("ident = " + ident);
  if (ident != process.env.IDENTIFIER) {
    return res.status(403).json({
      success: false,
      error: "wrong_identifier_on_authorization",
    });
  }
  const hashStr = arr[1].trim();
  console.log("hash string = ", hashStr);
  if (!hashStr) {
    return res.status(403).json({
      success: false,
      error: "hmac_authentication_failed",
    });
  }

  const pk = hashStr.split(":")[0];
  console.log("public key = ", pk);
  if (pk != encryptedPK) {
    return res.status(403).json({
      success: false,
      error: "hmac_authentication_failed",
    });
  }

  const hmac = hashStr.split(":")[1].trim();
  console.log("HMAC = ", hmac);

  if (method != "GET") {
    body = crypto.createHash("md5").update(JSON.stringify(req.body)).digest("hex");
    type = "application/json";
  }

  const stringToSign = method + "\n" + body + "\n" + type + "\n" + routeName;
  console.log(stringToSign);
  
  const compute_hmac = Buffer.from(
    crypto.createHmac("sha1", encryptedSK).update(stringToSign).digest("hex")
  ).toString("base64");
  console.log("computed_hmac = " + compute_hmac);
  
  if (compute_hmac != hmac) {
    return res.status(403).json({
      success: false,
      error: "hmac_authentication_failed",
    });
  }
  next();
};
