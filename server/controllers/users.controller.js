const userServices = require("../services/users.services");
const upload = require("../middleware/upload");


exports.create = (req, res, next) => {
    var model = {
        userEmail: req.body.userEmail,
        userPassword: req.body.userPassword,
    };

    userServices.createUser(model, (error, results) => {
        if (error) {
            return next(error);
        } else {
            return res.status(200).send({
                message: "Success",
                data: results
            });
        }
    });
};

exports.findAll = (req, res, next) => {
    var model = {
        userEmail: req.query.userEmail,
    };

    userServices.getUser(model, (error, results) => {
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

exports.findOne = (req, res, next) => {
    var model = {
        userId: req.params.id,
    };

    userServices.getUserById(model, (error, results) => {
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
    var model = {
        userId: req.params.id,
        userEmail: req.body.userEmail,
        userPassword: req.body.userPassword,
    };

    userServices.updateUser(model, (error, results) => {
        if (error) {
            return next(error);
        } else {
            return res.status(200).send({
                message: "Success",
                data: results,
            });
        }
    });
};

exports.delete = (req, res, next) => {
    var model = {
        userId: req.params.id,
    };

    userServices.deleteUser(model, (error, results) => {
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

exports.login = (req, res, next) =>{
    var model = {
        userEmail : req.body.userEmail,
        userPassword : req.body.userPassword,
    }
    userServices.getUserPerEmail(model, (error, results) => {
        if (error) {
            return next(error);
        } else {
            if(results.userPassword == model.userPassword && results.userEmail == model.userEmail){
                return res.status(200).send({
                    message: "Success",
                    data: results
                })
            }else{
                return res.status(400).send({
                    message: "Incorrect password",
                })
            }
        }
    });
   /* if(user && user.userPassword == userPassword){
        res.status(200).jsonp({message: 'Login'});
    }else{
        res.status(400).jsonp({message: 'No found user'});
    }; */
}