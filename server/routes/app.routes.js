const remindersController = require("../controllers/reminders.controller");
const express = require("express");
const router = express.Router();

router.post("/reminders", remindersController.create);
router.get("/reminders", remindersController.findAll);
router.get("/reminders/:id", remindersController.findOne);
router.put("/reminders/:id", remindersController.update);
router.delete("/reminders/:id", remindersController.delete);
router.get("/reminders/user/:user", remindersController.findPerUser);

module.exports = router;