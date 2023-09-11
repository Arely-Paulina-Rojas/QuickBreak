const usersController = require("../controllers/users.controller");
const express = require("express");
const router = express.Router();

router.post("/users", usersController.create);
router.get("/users", usersController.findAll);
router.get("/users/:id", usersController.findOne);
router.put("/users/:id", usersController.update);
router.delete("/users/:id", usersController.delete);
router.post("/users/login", usersController.login);

module.exports = router;