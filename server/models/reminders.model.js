const mongoose = require("mongoose");

const reminder = mongoose.model(
    "reminders",
    mongoose.Schema(
        {
            reminderName: String,
            reminderTime: String,
            reminderBreakTime: String,
            reminderActivity: String,
            reminderImage: String,
            reminderUser: {type: mongoose.Schema.ObjectId, ref: 'users'}
        },
        {
            timestamps: true,
        }
    )
);

module.exports = {
    reminder,
};