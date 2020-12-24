const { pool, queryDb } = require("../models/db");

pool.on("connect", () => {
  console.log("Connected to db!");
});
exports.search = async (req, res) => {
  const barcode = req.query.barcode;
  const queryBarcode = `SELECT b.id, barcode, color, category, lockbike, "dockId",bikevalue, baserentamount, addrentamount, saddle, pedal, rear
  FROM "ecoBikeSystem"."Bike" b
           JOIN "ecoBikeSystem"."BikeInfo" bi on b.bikeinfoid = bi.id
  WHERE b.barcode = $1;`;
  try {
    const { rows } = await queryDb(queryBarcode, [barcode]);
    if (rows.length == 0) {
      return res.status(404).json({
        success: false,
        error: "wrong_barcode",
      });
    }
    if (!rows[0].lockbike) {
      return res.status(400).json({
        success: false,
        error: "bike_already_rented",
      });
    }
    if (rows[0].category == "Ebike") {
      const queryEbike = `SELECT "battery" FROM ("ecoBikeSystem"."Bike" b JOIN "ecoBikeSystem"."Ebike" eb on b.id = eb.id) WHERE b.id = $1 ORDER BY b.id;`;
      const queryEbikeRes = await queryDb(queryEbike, [rows[0].id]);
      rows[0].battery = queryEbikeRes.rows[0].battery;
      // console.log(row)
    }
    if (rows[0].category == "TwinEbike") {
      const queryTwinEbike = `SELECT "battery" FROM ("ecoBikeSystem"."Bike" b JOIN "ecoBikeSystem"."TwinEbike" teb on b.id = teb.id) WHERE b.id = $1 ORDER BY b.id;`;
      const queryTwinEbikeRes = await queryDb(queryTwinEbike, [rows[0].id]);
      rows[0].battery = queryTwinEbikeRes.rows[0].battery;
    }
    return res.status(200).json({
      success: true,
      bike: rows[0],
    });
  } catch (err) {
    return res.status(400).json({
      success: false,
      error: `${err}`,
    });
  }
};
exports.unlockBike = async (req, res) => {
  const barcode = req.query.barcode;
  const queryUnlockBike = `UPDATE "ecoBikeSystem"."Bike" SET lockbike = false WHERE barcode = $1 RETURNING *;`;
  try {
    const { rows } = await queryDb(queryUnlockBike, [barcode]);
    if (rows.length == 0) {
      return res.status(404).json({
        success: false,
        error: "wrong_barcode",
      });
    }
    return res.status(200).json({
      success: true,
      barcode: barcode,
    });
  } catch (err) {
    return res.status(400).json({
      success: false,
      error: `${err}`,
    });
  }
};
exports.lockBike = async (req, res) => {
  const barcode = req.query.barcode;
  const queryLockBike = `UPDATE "ecoBikeSystem"."Bike" SET lockbike = true WHERE barcode = $1 RETURNING *;`;
  try {
    const { rows } = await queryDb(queryLockBike, [barcode]);
    if (rows.length == 0) {
      return res.status(404).json({
        success: false,
        error: "wrong_barcode",
      });
    }
    return res.status(200).json({
      success: true,
      barcode: barcode,
    });
  } catch (err) {
    return res.status(400).json({
      success: false,
      error: `${err}`,
    });
  }
};
exports.returnToDock = async (req, res) => {
  const { dockId, bikeId } = req.query;
  const queryCheckFullDock = `SELECT * FROM "ecoBikeSystem"."DockStation" as d
  WHERE (SELECT count(b.id) FROM "ecoBikeSystem"."Bike" b WHERE b."dockId" = d.id AND b.lockbike = true AND d.id = $1 GROUP BY d.id ) < d.size;`;
  const queryReturnBike = `UPDATE "ecoBikeSystem"."Bike"
  SET "dockId" = $1
  WHERE id = $2 RETURNING *;`;

  try {
    const checkDockRows = await queryDb(queryCheckFullDock, [dockId]);
    if (checkDockRows.rows.length == 0) {
      return res.status(400).json({
        success: false,
        error: `choosen_dock_is_full`,
      });
    }
    const bikeRows = await queryDb(queryReturnBike, [dockId, bikeId]);
    if (bikeRows.rows.length == 0) {
      return res.status(400).json({
        success: false,
        error: `wrong_bike_id`,
      });
    }
    return res.status(200).json({
      success: true,
      barcode: barcode,
    });
  } catch (err) {
    return res.status(400).json({
      success: false,
      error: `${err}`,
    });
  }
};
