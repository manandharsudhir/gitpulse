const pool = require("../data/index");
const { v4: uuidv4 } = require("uuid");
const bcrypt = require("bcrypt");
require("dotenv").config();
const jwt = require("jsonwebtoken");

const JWT_SECRET =
  "09f26e402586e2faa8da4c98a35f1b20d6b033c6097befa8be3486a829587fe2f90a832bd3ff9d42710a4da095a2ce285b009f0c3730cd9b8e1af3eb84df6611";

const loginUser = async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({
      success: false,
      message: "Please provide both email and password",
    });
  }

  try {
    // Check if email exists in the database
    const userResult = await pool.query("SELECT * FROM users WHERE email=$1", [
      email,
    ]);

    if (userResult.rowCount === 0) {
      return res.status(400).json({
        success: false,
        message: "Invalid email or password",
      });
    }

    const user = userResult.rows[0];

    // Compare the provided password with the hashed password in the database
    const isPasswordValid = await bcrypt.compare(password, user.password);

    if (!isPasswordValid) {
      return res.status(400).json({
        success: false,
        message: "Invalid email or password",
      });
    }

    // Generate JWT token
    const token = jwt.sign(
      { userId: user.id, email: user.email },
      JWT_SECRET,
      { expiresIn: "1h" } // Token expires in 1 hour
    );

    // Remove password from user object before sending the response
    const userWithoutPassword = { ...user };
    delete userWithoutPassword.password;

    // Return success response with user data and token
    res.status(200).json({
      success: true,
      message: "Login successful",
      user: userWithoutPassword,
      token, // Send the token in the response
    });
  } catch (err) {
    console.error("Error in loginUser:", err.message);
    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};

const signupUser = async (req, res) => {
  console.log("JWT_SECRET", JWT_SECRET);
  const { name, email, password } = req.body;

  if (!name || !email || !password) {
    return res.status(400).json({
      success: false,
      message: "Please provide name, email, and password",
    });
  }

  try {
    //check if username already exists
    const usernameExists = await pool.query(
      "SELECT * FROM users WHERE name=$1",
      [name]
    );
    console.log(usernameExists);
    if (usernameExists.rowCount > 0) {
      return res.status(400).json({
        success: false,
        message: "Username Already In Use",
      });
    }

    //check if email already exists
    const emailExists = await pool.query("SELECT * FROM users WHERE email=$1", [
      email,
    ]);
    if (emailExists.rowCount > 0) {
      return res.status(400).json({
        success: false,
        message: "Email Address Already In Use",
      });
    }

    //hash password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert user into database
    const userId = uuidv4();
    const newUser = await pool.query(
      `INSERT INTO users (id, name, email, password) VALUES ($1, $2, $3, $4) RETURNING *`,
      [userId, name, email, hashedPassword]
    );

    //Generate token
    const token = jwt.sign(
      { userId: newUser.rows[0].id, email: newUser.rows[0].email },
      JWT_SECRET,
      { expiresIn: "1h" } // Set token expiration (1 hour in this case)
    );

    res.status(201).json({
      success: true,
      message: "Signup successful",
      user: newUser.rows[0],
      token, // sending back the created user
    });
  } catch (err) {
    console.error("Error in signupUser:", err.message);
    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};
module.exports = {
  loginUser,
  signupUser,
};
