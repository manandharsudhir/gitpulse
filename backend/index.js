const express = require("express");
const app = express();
const pool = require("./data/index");
const { v4: uuidv4 } = require("uuid");
const cors = require("cors");
const usersRouter = require("./routes/users");
const projectsRouter = require("./routes/projects");
const hourLogsRouter = require("./routes/hour_logs");
const passport = require("passport");
const session = require("express-session");
require("./config/passport");

//MIDDLEWARES
app.use(express.json());
app.use(cors());

app.use(
  session({
    secret: "lQ4avebwLp2Jgaizm84oopmEDSOF03Te", // Secret for session encryption
    resave: false,
    saveUninitialized: true,
  })
);

// Initialize Passport.js
app.use(passport.initialize());
app.use(passport.session());

//ROUTES
app.get("/", (req, res) => {
  res.json({
    success: true,
    message: "Test Successful",
  });
});
//users
app.use("/api/v1/auth", usersRouter);

//projects
app.use("/api/v1/projects", projectsRouter);

//logs
app.use("/api/v1/hour-logs", hourLogsRouter);

app.post(
  "/github-webhook",
  async (req, res, next) => {
    try {
      const payload = req.body;
      console.log("Received GitHub webhook payload:", payload);

      const commits = payload.commits;

      if (commits) {
        for (let commit of commits) {
          const user_id = payload.pusher.id;
          const project_id = payload.repository.id;
          const hours_logged = 1;
          const description = commit.message;

          await pool.query(
            `INSERT INTO hour_logs (id, user_id, project_id, hours_logged, description)
             VALUES ($1, $2, $3, $4, $5)`,
            [uuidv4(), user_id, project_id, hours_logged, description]
          );
        }

        // ✅ After inserting all commits, call next
        next();
      } else {
        // ❌ Important: if no commits, end the flow here
        return res.status(400).send("No commits found in the payload.");
      }
    } catch (error) {
      console.error("Error processing the GitHub webhook:", error.message);
      return res.status(500).send("Internal server error");
    }
  },
  async (req, res) => {
    try {
      const result = await pool.query("SELECT * FROM hour_logs");

      if (result.rowCount === 0) {
        return res.status(404).json({
          success: false,
          message: "No hour logs found",
        });
      }

      return res.status(200).json({
        success: true,
        message: "Hour logs retrieved successfully",
        data: result.rows,
      });
    } catch (err) {
      console.error("Error retrieving hour logs:", err.message);
      return res.status(500).json({
        success: false,
        message: "Server error",
      });
    }
  }
);

app.get("/get-commit", async (req, res) => {
  const { projectId } = req.body;

  try {
    // Query the hour_logs table to retrieve all entries
    const result = await pool.query(
      "SELECT * FROM hour_logs WHERE project_id=$1",
      [projectId]
    );

    // If there are no records, return a message
    if (result.rowCount === 0) {
      return res.status(404).json({
        success: false,
        message: "No hour logs found",
      });
    }

    // Send the retrieved hour logs as a JSON response
    res.status(200).json({
      success: true,
      message: "Hour logs retrieved successfully",
      data: result.rows, // This contains all the records from the hour_logs table
    });
  } catch (err) {
    console.error("Error retrieving hour logs:", err.message);
    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
});

app.listen(4000, () => {
  console.log(`Server listening at port 4000`);
});
