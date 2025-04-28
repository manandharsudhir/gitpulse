const express = require("express");
const router = express.Router();

const { loginUser, signupUser } = require("../controllers/users");

router.post("/signup", signupUser);
router.post("/login", loginUser);

module.exports = router;
