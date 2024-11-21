const pengaduanController = require("../controller/pengaduan.controller");
const express = require('express');
const router = express.Router();

router.post("/addPengaduan", pengaduanController.addPengaduan);

module.exports = router;