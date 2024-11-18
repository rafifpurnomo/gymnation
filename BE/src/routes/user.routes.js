const express = require('express');
const router = express.Router();
const userController = require('../controller/user.controller')

router.post('/addUser', userController.addUser);
router.post('/changePassword', userController.changePassword);
router.post('/forgetPassword', userController.forgetPassword);
router.post('/addAdmin', userController.addAdmin);
router.get('/getAllUser', userController.getAllUser);

module.exports = router;