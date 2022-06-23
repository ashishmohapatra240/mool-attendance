const express = require("express");
const bcryptjs = require("bcryptjs");
const User = require("../models/user.js");


const authRouter = express.Router();
const jwt = require("jsonwebtoken");

//Signup Route
authRouter.post("/api/signup", async (req, res) => {
  try {
    const { phone, password } = req.body;

    const existingUser = await User.findOne({ phone });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same phone already exists!" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);
    let user = new User({
      phone,
      password: hashedPassword,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.get("/user", async (req, res) => {
  return res.send("Herlo");
  // res.json({msg:'Hey'});
});

//Signin Route
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { phone, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      res.send
        .status(400)
        .json({ msg: "User with this email does not exist! " });
    }
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      res.send.status(400).json({ msg: "Incorrect Password " });
    }
    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
    console.log(res.send);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});





module.exports = authRouter;




