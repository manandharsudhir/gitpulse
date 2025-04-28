const express = require("express");
const app = express();

//middlewares

//routes
app.get("/", (req, res) => {
  res.json({
    success: true,
    message: "Test Successful",
  });
});

app.listen(4000, () => {
  console.log(`Server listening at port 4000`);
});
