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
exports.searchAndCreateCard = async (req, res) => {
  const { cardCode, cardName, dateExpired, cvvCode } = req.query.card;
  const querySearchCard = `SELECT * FROM "ecoBikeSystem"."Card" WHERE "cardCode" = $1`;
  const queryCreateCard = `INSERT INTO "ecoBikeSystem"."Card" ("cardCode", "cardName", "dateExpired", "cvvCode") VALUES ( $1, $2, $3, $4) RETURNING *`;
  try {
    let cardId = undefined;
    let cardInst = await queryDb(querySearchCard, [cardCode]);
    if (cardInst.rows.length == 0) {
      cardInst = await queryDb(queryCreateCard, [
        cardCode,
        cardName,
        dateExpired,
        cvvCode,
      ]);
    }
    cardId = cardInst.rows[0].id;
    return res.status(200).json({
      success: true,
      cardId: cardId,
    });
  } catch (err) {
    return res.status(400).json({
      success: false,
      error: `${err}`,
    });
  }
};
exports.unlockCard = async (req, res) => {
  const cardId = req.query.cardId;
  const queryUnlockCard = `UPDATE "ecoBikeSystem"."Card"SET lock = false WHERE id = $1 RETURNING *;`;
  try {
    const { rows } = await queryDb(queryUnlockCard, [cardId]);
    if (rows.length == 0) {
      return res.status(404).json({
        success: false,
        error: "wrong_cardId",
      });
    }
    return res.status(200).json({
      success: true,
      cardId: cardId,
    });
  } catch (err) {
    return res.status(400).json({
      success: false,
      error: `${err}`,
    });
  }
};
exports.lockCard = async (req, res) => {
  const cardId = req.query.cardId;
  const queryLockCard = `UPDATE "ecoBikeSystem"."Card"SET lock = true WHERE id = $1 RETURNING *;`;
  try {
    const { rows } = await queryDb(queryLockCard, [cardId]);
    if (rows.length == 0) {
      return res.status(404).json({
        success: false,
        error: "wrong_cardId",
      });
    }
    return res.status(200).json({
      success: true,
      cardId: cardId,
    });
  } catch (err) {
    return res.status(400).json({
      success: false,
      error: `${err}`,
    });
  }
};
