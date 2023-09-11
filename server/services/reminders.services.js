const { response } = require("express");
const { reminder } = require("../models/reminders.model");

async function createReminder(params, callback) {
    if (!params.reminderName) {
        return callback(
            {
                message: "Reminder Name Required",
            },
            ""
        );
    }

    const reminderModel = reminder(params);
    reminderModel
        .save()
        .then((response) => {
            return callback(null, response);
        })
        .catch((error) => {
            return callback(error);
        });
}

async function getReminder(params, callback) {
    const reminderName = params.reminderName;
    var condition = reminderName
        ? {
            reminderName: { $regex: new RegExp(reminderName), $option: "i" },
        }
        : {};

    reminder
        .find(condition)
        .then((response) => {
            return callback(null, response);
        })
        .catch((error) => {
            return callback(error);
        });
}

async function getReminderPerUser(params, callback){
    const reminderUser = params.reminderUser;

    reminder
        .find({reminderUser: reminderUser})
        .then((response) => {
            if(!response) callback("User Invalid!");
            else return callback(null, response);
        })
        .catch((error) => {
            return callback(error);
        })
}

async function getReminderById(params, callback) {
    const reminderId = params.reminderId;
    
    reminder
        .findById(reminderId)
        .then((response) => {
            if (!response) callback("Reminder Id Invalid!");
            else return callback(null, response);
        })
        .catch((error) => {
            return callback(error);
        });
}

async function updateReminder(params, callback) {
    const reminderId = params.reminderId;
    
    reminder
        .findByIdAndUpdate(reminderId, params, { useFindAndModify: false })
        .then((response) => {
            if (!response) callback("Reminder Id Invalid!");
            else return callback(null, response);
        })
        .catch((error) => {
            return callback(error);
        });
}

async function deleteReminder(params, callback) {
    const reminderId = params.reminderId;
    
    reminder
        .findByIdAndRemove(reminderId)
        .then((response) => {
            if (!response) callback("Reminder Id Invalid!");
            else return callback(null, response);
        })
        .catch((error) => {
            return callback(error);
        });
}

module.exports = {
    createReminder,
    getReminder,
    getReminderById,
    updateReminder,
    deleteReminder,
    getReminderPerUser,
};
