const express = require("express");
const app = express();
const cors = require("cors");
const usersRouter = require("./routes/users");

//MIDDLEWARES
app.use(express.json());
app.use(cors());

//ROUTES
app.get("/", (req, res) => {
  res.json({
    success: true,
    message: "Test Successful",
  });
});
//users
app.use("/api/v1/users", usersRouter);

app.listen(4000, () => {
  console.log(`Server listening at port 4000`);
});
