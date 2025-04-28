const express = require("express");
const app = express();
const cors = require("cors");
const usersRouter = require("./routes/users");
const projectsRouter = require("./routes/projects");
const userProjectsRouter = require("./routes/user_projects");
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
app.use("/api/v1/hour-logs", userProjectsRouter);

app.listen(4000, () => {
  console.log(`Server listening at port 4000`);
});
