require("dotenv").config();
const PORT = process.env.PORT;
const express = require("express");
const cors = require("cors");
const app = express();

app.use(cors());
app.use(express.json());

app.listen(PORT, () => {
  console.log(`
      ## MAIN ROUTE
      -listening at http://localhost:${PORT}
      `);
});
