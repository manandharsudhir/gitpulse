const express = require("express");
const router = express.Router();
const {
  addHourLog,
  getHourLogByUserIdAndProjectId,
} = require("../controllers/hour_logs");

router.post("/", addHourLog);
router.get("/", getHourLogByUserIdAndProjectId);

module.exports = router;
