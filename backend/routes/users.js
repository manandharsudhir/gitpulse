const express = require("express");
const router = express.Router();
const passport = require("passport");
const jwt = require("jsonwebtoken");

const { loginUser, signupUser } = require("../controllers/users");

const JWT_SECRET =
  "09f26e402586e2faa8da4c98a35f1b20d6b033c6097befa8be3486a829587fe2f90a832bd3ff9d42710a4da095a2ce285b009f0c3730cd9b8e1af3eb84df6611";

router.post("/signup", signupUser);
router.post("/login", loginUser);
// Route to start GitHub authentication
router.get("/github", (req, res, next) => {
  passport.authenticate("github", { scope: ["user:email"] })(req, res, next);
});

// GitHub callback after successful login
router.get(
  "/github/callback",
  passport.authenticate("github", {
    failureRedirect: "/login", // Redirect if authentication fails
  }),
  (req, res) => {
    // Upon successful login, create JWT token
    const token = jwt.sign(
      { userId: req.user.id, email: req.user.email },
      JWT_SECRET,
      { expiresIn: "1h" } // 1 hour expiration for the JWT token
    );

    // Send the JWT token and user data (excluding password)
    const userWithoutPassword = { ...req.user };
    delete userWithoutPassword.password;

    res.status(200).json({
      success: true,
      message: "GitHub login successful",
      user: userWithoutPassword,
      token, // Send token back in the response
    });
  }
);

module.exports = router;
