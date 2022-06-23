const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  phone: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re = /^[6-9]\d{9}$/;
        return value.match(re);
      },
      message: "Please enter a valid phonenumber",
    },
  },
  password: {
    require: true,
    type: String,
    validator: (value) => {
      return value.length > 6;
    },
  },
});

const User = mongoose.model("User", userSchema);
module.exports = User;
