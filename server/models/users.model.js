const mongoose = require("mongoose");

const user = mongoose.model(
    "users",
    mongoose.Schema(
        {
            userEmail: {type: String, required: true, unique: true},
            userPassword: String,
        },
        {
            timestamps: true,
        }
    )
);

module.exports = {
    user,
};