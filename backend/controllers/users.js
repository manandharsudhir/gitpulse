const loginUser = async (req, res) => {};
const signupUser = async (req, res) => {
  res.json({
    success: true,
    message: "Signup Successful",
  });
};
module.exports = {
  loginUser,
  signupUser,
};
