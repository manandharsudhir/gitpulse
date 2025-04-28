const express = require("express");
const router = express.Router();
const { editProject, addProject } = require("../controllers/projects");

router.put("/", editProject);
router.post("/", addProject);

module.exports = router;
