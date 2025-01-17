const { pool, queryDb } = require("../models/db");
exports.createPayment = async (req, res) => {
  const {
    rentalCode,
    depositAmount,
    startRentTime,
    endRentTime,
    bikeId,
    cardId,
    status,
  } = req.body.payment;
  const queryCreatePayment = `INSERT INTO "ecoBikeSystem"."Payment" ("rentalCode", "rentAmount", "depositAmount", "startRentTime", "endRentTime", statusid, "bikeId", "cardId") VALUES ($1, 0, $2, $3 , $4, $5, $6,$7) RETURNING *;`;
  try {
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
        paymentId: paymentInst.rows[0].id,
        bikeId: bikeId,
        cardId: cardId,
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
           JOIN ("ecoBikeSystem"."Bike" B JOIN "ecoBikeSystem"."BikeInfo" BI on B.bikeinfoid = BI.id) on B.id = P."bikeId"
           JOIN "ecoBikeSystem"."Card" C on P."cardId" = C.id
           JOIN "ecoBikeSystem"."PaymentStatus" PS on PS.id = P.statusid
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
        bikevalue: payment.bikevalue,
        baserentamount: payment.baserentamount,
        addrentamount: payment.addrentamount,
        saddle: payment.saddle,
        pedal: payment.pedal,
        rear: payment.rear,
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
  const { rentalCode, rentAmount, endRentTime, status } = req.body.payment;
  // const { dockId } = bike;
  // const queryCheckFullDock = `SELECT * FROM "ecoBikeSystem"."DockStation" as d
  // WHERE (SELECT count(b.id) FROM "ecoBikeSystem"."Bike" b WHERE b."dockId" = d.id AND b.lockbike = true AND d.id = $1 GROUP BY d.id ) < d.size;`;
  const queryUpdatePayment = `UPDATE "ecoBikeSystem"."Payment"
  SET statusid        = $1,
      "endRentTime" = $2,
      "rentAmount"  = $3
  WHERE "rentalCode" = $4 RETURNING *;`;
  // const queryUpdateCard = `UPDATE "ecoBikeSystem"."Card"
  // SET lock = false
  // WHERE id = $1 RETURNING *;`;
  // const queryUpdateBike = `UPDATE "ecoBikeSystem"."Bike"
  // SET "dockId" = $1,
  //     lockbike = true
  // WHERE id = $2 RETURNING *;`;
  try {
    // const checkDockRows = await queryDb(queryCheckFullDock, [dockId]);
    // if (checkDockRows.rows.length == 0) {
    //   return res.status(400).json({
    //     success: false,
    //     error: `choosen_dock_is_full`,
    //   });
    // }
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
    // const cardId = paymentRows.rows[0].cardId;
    // const cardRows = await queryDb(queryUpdateCard, [cardId]);

    // if (cardRows.rows.length == 0) {
    //   return res.status(400).json({
    //     success: false,
    //     error: `wrong_card_id`,
    //   });
    // }

    // const bikeId = paymentRows.rows[0].bikeId;
    // const bikeRows = await queryDb(queryUpdateBike, [dockId, bikeId]);
    // if (bikeRows.rows.length == 0) {
    //   return res.status(400).json({
    //     success: false,
    //     error: `wrong_bike_id`,
    //   });
    // }

    return res.status(200).json({
      success: true,
      rentalCode: rentalCode,
      status: status,
      bikeId: paymentRows.rows[0].bikeId,
      cardId: paymentRows.rows[0].cardId,
    });
  } catch (err) {
    return res.status(400).json({
      success: false,
      error: `${err}`,
    });
  }
};
