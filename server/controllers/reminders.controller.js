const reminderServices = require("../services/reminders.services");
const upload = require("../middleware/upload");

exports.create = (req, res, next) => {
    upload(req, res, function (err) {
        if (err) {
            next(err);
        } else {
            const url = req.protocol + "://" + req.get("host");
            const path = req.file != undefined ? req.file.path.replace(/\\/g, "/") : "";

            var model = {
                reminderName: req.body.reminderName,
                reminderTime: req.body.reminderTime,
                reminderBreakTime: req.body.reminderBreakTime,
                reminderActivity: req.body.reminderActivity,
                reminderImage: path != "" ? url + "/" + path : "",
                reminderUser: req.body.reminderUser,
            };

            reminderServices.createReminder(model, (error, results) => {
                if (error) {
                    return next(error);
                } else {
                    return res.status(200).send({
                        message: "Success",
                        data: results
                    });
                }
            });
        }
    });
};

exports.findAll = (req, res, next) => {
    var model = {
        reminderName: req.query.reminderName,
    };

    reminderServices.getReminder(model, (error, results) => {
        if (error) {
            return next(error);
        } else {
            return res.status(200).send({
                message: "Success",
                data: results
            });
        }
    });
}

exports.findPerUser = (req, res, next) => {
    var model = {
        reminderUser: req.params.user,
    } 

    reminderServices.getReminderPerUser(model, (error, results) => {
        if(error) {
            return next(error);
        } else {
            return res.status(200).send({
                message: "Success",
                data: results
            });
        }
    })


}

exports.findOne = (req, res, next) => {
    var model = {
        reminderId: req.params.id,
    };

    reminderServices.getReminderById(model, (error, results) => {
        if (error) {
            return next(error);
        } else {
            return res.status(200).send({
                message: "Success",
                data: results
            });
        }
    });
}

exports.update = (req, res, next) => {
    upload(req, res, function (err) {
        if (err) {
            next(err);
        } else {
            const url = req.protocol + "://" + req.get("host");
            const path = req.file != undefined ? req.file.path.replace(/\\/g, "/") : "";

            var model = {
                reminderId: req.params.id,
                reminderName: req.body.reminderName,
                reminderTime: req.body.reminderTime,
                reminderBreakTime: req.body.reminderBreakTime,
                reminderActivity: req.body.reminderActivity,
                reminderImage: path != "" ? url + "/" + path : "",
            };

            reminderServices.updateReminder(model, (error, results) => {
                if (error) {
                    return next(error);
                } else {
                    return res.status(200).send({
                        message: "Success",
                        data: results,
                    });
                }
            });
        }
    });
};

exports.delete = (req, res, next) => {
    var model = {
        reminderId: req.params.id,
    };

    reminderServices.deleteReminder(model, (error, results) => {
        if (error) {
            return next(error);
        } else {
            return res.status(200).send({
                message: "Success",
                data: results
            });
        }
    });
}


