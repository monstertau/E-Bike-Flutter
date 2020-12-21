const { pool, queryDb } = require("../models/db");
exports.createPayment = async (req, res) => {
  const {
    rentalCode,
    depositAmount,
    startRentTime,
    endRentTime,
    bikeId,
    status,
    card,
  } = req.body.payment;
  const { cardCode, cardName, dateExpired, cvvCode } = card;
  const querySearchCard = `SELECT * FROM "ecoBikeSystem"."Card" WHERE "cardCode" = $1`;
  const queryCreateCard = `INSERT INTO "ecoBikeSystem"."Card" ("cardCode", "cardName", "dateExpired", "cvvCode") VALUES ( $1, $2, $3, $4) RETURNING *`;
  const queryCreatePayment = `INSERT INTO "ecoBikeSystem"."Payment" ("rentalCode", "rentamount", "depositAmount", "startRentTime", "endRentTime", status, "bikeId", "cardId") VALUES ( $1, 0, $2, $3, $4, $5, $6, $7) RETURNING *;`;
  try {
    let cardId = undefined;
    let paymentId = undefined;
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
    const paymentInst = await queryDb(queryCreatePayment, [
      rentalCode,
      depositAmount,
      startRentTime,
      endRentTime,
      status,
      bikeId,
      cardId,
    ]);
    return res.status(201).json({
      success: true,
      payment: {
        paymentId: paymentId,
        bikeId: bikeId,
        cardCode: cardCode,
        rentalCode: rentalCode,
        rentAmount: 0,
        depositAmount: depositAmount,
        startRentTime: startRentTime,
        status: status,
      },
    });
  } catch (err) {
    return res.status(400).json({
      success: false,
      error: `${err}`,
    });
  }
};
exports.searchPayment = async (req, res) => {
  const { rentalCode } = req.body;
  const querySearchPayment = `SELECT *
  FROM "ecoBikeSystem"."Payment" P
           JOIN "ecoBikeSystem"."Bike" B on B.id = P."bikeId"
           JOIN "ecoBikeSystem"."Card" C on P."cardId" = C.id
  WHERE P."rentalCode" = $1;`;
  try {
    const { rows } = await queryDb(querySearchPayment, [rentalCode]);
    if (rows.length != 0) {
      const payment = rows[0];
      const bike = {
        id: payment.bikeId,
        color: payment.color,
        barcode: payment.barcode,
        category: payment.category,
        lock: payment.lockbike,
      };
      const card = {
        id: payment.cardId,
        cardCode: payment.cardCode,
        cardName: payment.cardName,
        dateExpired: payment.dateExpired,
        cvvCode: payment.cvvCode,
        lock: payment.lock,
      };
      console.log(payment);
      if (payment.category == "Ebike") {
        const queryEbike = `SELECT "battery" FROM ("ecoBikeSystem"."Bike" b JOIN "ecoBikeSystem"."Ebike" eb on b.id = eb.id) WHERE b.id = $1 ORDER BY b.id;`;
        const queryEbikeRes = await queryDb(queryEbike, [payment.bikeId]);
        bike.battery = queryEbikeRes.rows[0].battery;
      }
      if (payment.category == "TwinEbike") {
        const queryTwinEbike = `SELECT "battery" FROM ("ecoBikeSystem"."Bike" b JOIN "ecoBikeSystem"."TwinEbike" teb on b.id = teb.id) WHERE b.id = $1 ORDER BY b.id;`;
        const queryTwinEbikeRes = await queryDb(queryTwinEbike, [
          payment.bikeId,
        ]);
        bike.battery = queryTwinEbikeRes.rows[0].battery;
      }
      return res.status(201).json({
        success: true,
        payment: {
          paymentId: payment.id,
          rentalCode: payment.rentalCode,
          rentAmount: payment.rentamount,
          depositAmount: payment.depositAmount,
          startRentTime: payment.startRentTime,
          endRentTime: payment.endRentTime,
          status: payment.status,
          bike: bike,
          card: card,
        },
      });
    } else {
      return res.status(201).json({
        success: false,
        error: "cant_find_renting_payment",
      });
    }
  } catch (err) {
    return res.status(400).json({
      success: false,
      error: `${err}`,
    });
  }
};
exports.updatePayment = async (req, res) => {
  const {
    rentalCode,
    rentAmount,
    endRentTime,
    bike,
    card,
    status,
  } = req.body.payment;
  const { cardCode } = card;
  const { barcode, dockId } = bike;
  const queryUpdatePayment = `UPDATE "ecoBikeSystem"."Payment"
  SET status        = $1,
      "endRentTime" = $2,
      "rentamount"  = $3
  WHERE "rentalCode" = $4 RETURNING *;`;
  const queryUpdateCard = `UPDATE "ecoBikeSystem"."Card"
  SET lock = false
  WHERE "cardCode" = $1 RETURNING *;`;
  const queryUpdateBike = `UPDATE "ecoBikeSystem"."Bike"
  SET "dockId" = $1,
      lockbike = true
  WHERE barcode = $2 RETURNING *;`;
  try {
    const paymentRows = await queryDb(queryUpdatePayment, [
      status,
      endRentTime,
      rentAmount,
      rentalCode,
    ]);

    if (paymentRows.rows.length == 0) {
      return res.status(400).json({
        success: false,
        error: `wrong_rental_code`,
      });
    }

    const cardRows = await queryDb(queryUpdateCard, [cardCode]);

    if (cardRows.rows.length == 0) {
      return res.status(400).json({
        success: false,
        error: `wrong_card_code`,
      });
    }

    const bikeRows = await queryDb(queryUpdateBike, [dockId, barcode]);

    if (bikeRows.rows.length == 0) {
      return res.status(400).json({
        success: false,
        error: `wrong_barcode_code`,
      });
    }

    return res.status(200).json({
      success: true,
    });
  } catch (err) {
    return res.status(400).json({
      success: false,
      error: `${err}`,
    });
  }
};
