const express = require("express");
const router = express.Router();

const { loginUser, signupUser } = require("../controllers/users");

router.post("/", signupUser);
router.post("/login", loginUser);

module.exports = router;
