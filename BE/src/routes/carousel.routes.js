const express = require('express');
const router = express.Router();
const carouselController = require('../controller/carousel.controller');
const multer = require("../middleware/multer");

router.post('/addCarousel', multer.single('carousel_img'), carouselController.addCarouselData);
router.get('/getCarousel', carouselController.getAllCarouselData);
router.delete('/deleteCarousel/:id_carousel', carouselController.deleteCarouselData);

module.exports = router;