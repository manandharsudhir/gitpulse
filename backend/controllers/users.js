const pool = require("../data/index");
const { v4: uuidv4 } = require("uuid");
const bcrypt = require("bcrypt");
const dotenv = require("dotenv").config();

const JWT_SECRET = process.env.JWT_SECRET;

const loginUser = async (req, res) => {};

const signupUser = async (req, res) => {
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
