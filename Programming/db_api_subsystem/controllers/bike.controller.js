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
            message:"wrong_barcode"
        })
    }
    if (!rows[0].lock){
        return res.status(400).json({
            success:false,
            message:"bike_already_rented"
        })
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
