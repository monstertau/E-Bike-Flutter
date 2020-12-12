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
      FROM ("ecoBikeSystem"."DockStation" as d
      JOIN "ecoBikeSystem"."BikeInDock" as BID on d.id = BID."DockId")
           LEFT OUTER JOIN "ecoBikeSystem"."Bike" as b on b.id = BID."BikeId" AND b.lock = true
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
  console.log(req.query);
  const queryDetail = `SELECT b.id, barcode, color, category, "bikeValue", "baseRentAmount", "additionalRentAmount", lock FROM ("ecoBikeSystem"."DockStation" as d
  JOIN "ecoBikeSystem"."BikeInDock" as BID on d.id = BID."DockId" AND d.id = $1)
       JOIN "ecoBikeSystem"."Bike" b on b.id = BID."BikeId" ORDER BY b.id`;
  try {
    const { rows } = await queryDb(queryDetail, [id]);
    console.log(rows);
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
