const passport = require("passport");
const GitHubStrategy = require("passport-github2").Strategy;
const { Pool } = require("pg");
const pool = require("../data/index"); // Adjust this based on your database setup
require("dotenv").config();

// Set up GitHub strategy
passport.use(
  new GitHubStrategy(
    {
      clientID: "Ov23liTmt9yDCw7rvVhI",
      clientSecret: "40439510cdb4943844705a8ef1ece9ad280c9113",
      callbackURL: "http://localhost:4000/api/v1/auth/github/callback", // Adjust this if you deploy
    },
    async (accessToken, refreshToken, profile, done) => {
      try {
        const { id, username, emails } = profile;
        const email = emails && emails[0].value; // GitHub emails are an array, get the first one

        // Find or create the user in the database
        const userResult = await pool.query(
          "SELECT * FROM users WHERE github_id = $1",
          [id]
        );

        if (userResult.rowCount > 0) {
          return done(null, userResult.rows[0]);
        }

        // Create a new user if not found
        const newUser = await pool.query(
          "INSERT INTO users (github_id, name, email) VALUES ($1, $2, $3) RETURNING *",
          [id, username, email]
        );

        done(null, newUser.rows[0]);
      } catch (err) {
        done(err);
      }
    }
  )
);

passport.serializeUser((user, done) => {
  done(null, user);
});

passport.deserializeUser((user, done) => {
  done(null, user);
});
