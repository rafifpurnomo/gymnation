require("dotenv").config();
const PORT = process.env.PORT;
const express = require("express");
const cors = require("cors");
const app = express();
const userRoute = require('./routes/user.routes');
const authRoute = require('./routes/auth.routes');
const carouselRoute = require('./routes/carousel.routes');
const pengaduanRoute = require('./routes/pengaduan.routes')

app.use(cors());
app.use(express.json());

app.use(
  cors({
    origin: "http://localhost:8000", // Laravel berjalan di port 8000
    methods: ["GET", "POST", "PUT", "DELETE"],
    allowedHeaders: ["Content-Type", "Authorization"],
  })
);

app.use("/auth", authRoute)
app.use("/user", userRoute);
app.use("/carousel", carouselRoute);
app.use("/pengaduan", pengaduanRoute);

app.listen(PORT, () => {
  console.log(`
      ## MAIN ROUTE
      > listening at http://localhost:${PORT}

      ## UNTUK PENGGUNAAN API DI MOBILE
      > ngrok http {PORT}
      jalankan diterminal lain
      `);
});
