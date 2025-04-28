const express = require("express");
const router = express.Router();
const {
  addHourLog,
  getHourLogByUserIdAndProjectId,
} = require("../controllers/user_projects");

router.post("/", addHourLog);
router.get("/", getHourLogByUserIdAndProjectId);

module.exports = router;
