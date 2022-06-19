const express = require("express");
const mongoose = require("mongoose");

const authRouter = require("./routes/auth.js");

//INIT
const PORT = process.env.PORT || 5000;
const app = express();
const DB =
  "mongodb+srv://mool123:mool123@cluster0.1cykt.mongodb.net/?retryWrites=true&w=majority";

//Middleware
app.use(express.json());
app.use(authRouter);

//Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at PORT ${PORT}`);
});
