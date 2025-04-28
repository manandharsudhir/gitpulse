const express = require("express");
const router = express.Router();
const { addHourLog } = require("../controllers/user_projects");

router.post("/", addHourLog);
// router.post("/", addProject);

module.exports = router;
