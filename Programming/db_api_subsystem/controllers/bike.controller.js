const { pool, queryDb } = require("../models/db");

pool.on("connect", () => {
  console.log("Connected to db!");
});
exports.search = async (req, res) => {
  const barcode = req.query.barcode;
  const queryBarcode = `SELECT * FROM "ecoBikeSystem"."Bike" b WHERE b.barcode = $1`;
  try {
    const { rows } = await queryDb(queryBarcode, [barcode]);
    if(rows.length == 0){
        return res.status(404).json({
            success:false,
            error:"wrong_barcode"
        })
    }
    if (!rows[0].lockbike){
        return res.status(400).json({
            success:false,
            error:"bike_already_rented"
        })
    }
    if(rows[0].category == "Ebike"){
      const queryEbike = `SELECT "battery" FROM ("ecoBikeSystem"."Bike" b JOIN "ecoBikeSystem"."Ebike" eb on b.id = eb.id) WHERE b.id = $1 ORDER BY b.id;`
      const queryEbikeRes = await queryDb(queryEbike,[rows[0].id])
      rows[0].battery = queryEbikeRes.rows[0].battery
      // console.log(row)
    }
    if(rows[0].category == "TwinEbike"){
      const queryTwinEbike = `SELECT "battery" FROM ("ecoBikeSystem"."Bike" b JOIN "ecoBikeSystem"."TwinEbike" teb on b.id = teb.id) WHERE b.id = $1 ORDER BY b.id;`
      const queryTwinEbikeRes = await queryDb(queryTwinEbike,[rows[0].id])
      rows[0].battery = queryTwinEbikeRes.rows[0].battery
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
