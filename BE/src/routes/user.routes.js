const express = require('express');
const router = express.Router();
const userController = require('../controller/user.controller');
const verifyJWT = require('../middleware/verifyJWT');

router.post('/addUser', userController.addUser);
router.post('/changePassword', verifyJWT, userController.changePassword);
router.post('/forgetPassword', userController.forgetPassword);
router.post('/addAdmin', userController.addAdmin);
router.get('/getAllUser', userController.getAllUser);

module.exports = router;