const { pool, queryDb } = require("../models/db");

exports.checkLock = async (req, res) => {
  const cardCode = req.query.cardCode;
  const queryCard = `SELECT * FROM "ecoBikeSystem"."Card" c WHERE c.lock = true AND c."cardCode" = $1`;
  try {
    const { rows } = await queryDb(queryCard, [cardCode]);
    if (rows.length == 0) {
      return res.status(200).json({
        success: true,
        isLock: false,
      });
    } else {
      return res.status(200).json({
        success: true,
        isLock: true,
      });
    }
  } catch (err) {
    return res.status(400).json({
      success: false,
      error: `${err}`,
    });
  }
};
