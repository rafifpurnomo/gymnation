require("dotenv").config();
const PORT = process.env.PORT;
const express = require("express");
const cors = require("cors");
const app = express();
const userRoute = require('./routes/user.routes');
const authRoute = require('./routes/auth.routes');
const carouselRoute = require('./routes/carousel.routes');

app.use(cors());
app.use(express.json());

app.use("/auth", authRoute)
app.use("/user", userRoute);
app.use("/carousel", carouselRoute);

app.listen(PORT, () => {
  console.log(`
      ## MAIN ROUTE
      > listening at http://localhost:${PORT}

      ## UNTUK PENGGUNAAN API DI MOBILE
      > ngrok http {PORT}
      jalankan diterminal lain
      `);
});
