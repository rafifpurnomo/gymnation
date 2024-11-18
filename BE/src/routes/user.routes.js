const express = require('express');
const router = express.Router();
const userController = require('../controller/user.controller')

router.post('/addUser', userController.addUser);
router.post('/addAdmin', userController.addAdmin);
router.get('/getAllUser', userController.getAllUser);

module.exports = router;