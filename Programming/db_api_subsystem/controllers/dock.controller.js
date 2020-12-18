const { pool, queryDb } = require("../models/db");

pool.on("connect", () => {
  console.log("Connected to db!");
});
exports.test = async (req, res) => {
  return res.status(200).json({
    success: true,
  });
};
exports.getAll = async (req, res) => {
  const queryAll = `SELECT d.id, name, area, size, address, count(b.id) as available
  FROM "ecoBikeSystem"."DockStation" as d
           LEFT OUTER JOIN "ecoBikeSystem"."Bike" as b on b."dockId" = d.id AND b.lock = true
  GROUP BY d.id
  ORDER BY d.id;`;
  try {
    const { rows } = await queryDb(queryAll);

    return res.status(200).json({
      success: true,
      docks: rows,
    });
  } catch (err) {
    return res.status(400).json({
      success: false,
      error: `${err}`,
    });
  }
};

exports.getDetail = async (req, res) => {
  const { id } = req.query;

  if (!id) {
    return res.status(400).json({
      success: false,
      error: "missing_query_param",
    });
  }
  const queryDetail = `SELECT b.id, barcode, color, category, "bikeValue", "baseRentAmount", "additionalRentAmount", lock FROM "ecoBikeSystem"."DockStation" as d
  JOIN "ecoBikeSystem"."Bike" b on b."dockId" = d.id AND b."dockId" = $1 ORDER BY b.id;`;
  try {
    const { rows } = await queryDb(queryDetail, [id]);
    if (rows.length != 0) {
      for (row of rows) {
        if(row.category == "Ebike"){
          const queryEbike = `SELECT "battery" FROM ("ecoBikeSystem"."Bike" b JOIN "ecoBikeSystem"."Ebike" eb on b.id = eb.id) WHERE b.id = $1 ORDER BY b.id;`
          const queryEbikeRes = await queryDb(queryEbike,[row.id])
          row.battery = queryEbikeRes.rows[0].battery
          // console.log(row)
        }
        if(row.category == "TwinEbike"){
          const queryTwinEbike = `SELECT "battery" FROM ("ecoBikeSystem"."Bike" b JOIN "ecoBikeSystem"."TwinEbike" teb on b.id = teb.id) WHERE b.id = $1 ORDER BY b.id;`
          const queryTwinEbikeRes = await queryDb(queryTwinEbike,[row.id])
          row.battery = queryTwinEbikeRes.rows[0].battery
        }
      }
    }
    return res.status(200).json({
      success: true,
      bikes: rows,
    });
  } catch (err) {
    return res.status(400).json({
      success: false,
      error: `${err}`,
    });
  }
};
