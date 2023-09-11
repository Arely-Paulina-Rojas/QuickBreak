const { response } = require("express");
const { user } = require("../models/users.model");

async function createUser(params, callback) {
    if (!params.userEmail) {
        return callback(
            {
                message: "Email Required",
            },
            ""
        );
    }

    const userModel = user(params);
    userModel
        .save()
        .then((response) => {
            return callback(null, response);
        })
        .catch((error) => {
            return callback(error);
        });
}

async function getUser(params, callback) {
    const userEmail = params.userEmail;
    var condition = userEmail
        ? {
            userEmail: { $regex: new RegExp(userEmail), $option: "i" },
        }
        : {};

    user
        .find(condition)
        .then((response) => {
            return callback(null, response);
        })
        .catch((error) => {
            return callback(error);
        });
}

async function getUserById(params, callback) {
    const userId = params.userId;
    
    user
        .findById(userId)
        .then((response) => {
            if (!response) callback("User Id Invalid!");
            else return callback(null, response);
        })
        .catch((error) => {
            return callback(error);
        });
}

async function updateUser(params, callback) {
    const userId = params.userId;
    
    user
        .findByIdAndUpdate(userId, params, { useFindAndModify: false })
        .then((response) => {
            if (!response) callback("User Id Invalid!");
            else return callback(null, response);
        })
        .catch((error) => {
            return callback(error);
        });
}

async function deleteUser(params, callback) {
    const userId = params.userId;
    
    user
        .findByIdAndRemove(userId)
        .then((response) => {
            if (!response) callback("User Id Invalid!");
            else return callback(null, response);
        })
        .catch((error) => {
            return callback(error);
        });
}

async function getUserPerEmail(params, callback) {
    const userEmail = params.userEmail;

    user
        .findOne({userEmail: userEmail})
        .then((response) => {
            if(!response) callback("Invalid Email!");
            else return callback(null, response);
        })
        .catch((error) =>{
            return callback(error);
        });
}

module.exports = {
    createUser,
    getUser,
    getUserById,
    updateUser,
    deleteUser,
    getUserPerEmail,
};