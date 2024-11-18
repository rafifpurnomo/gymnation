const userModel = require("../model/user");

const addUser = async (req, res) => {
  const { first_name, last_name, email, password } = req.body;
  const role = "pelanggan";

  try {
    const [cekUser] = await userModel.searchByEmail(email);

    if (cekUser.length > 0) {
      return res.status(400).json({
        message: "email sudah terdaftar",
        success: false,
      });
    }

    await userModel.addPelanggan(first_name, last_name, email, password, role);
    res.status(200).json({ message: "pelanggan registered successfully" });
  } catch (error) {
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

const addAdmin = async (req, res) => {
  const { first_name, last_name, email, password } = req.body;
  const role = "admin";

  try {
    const [cekUser] = await userModel.searchByEmail(email);

    if (cekUser.length > 0) {
      return res.status(400).json({
        message: "email sudah terdaftar",
        success: false,
      });
    }

    await userModel.addPelanggan(first_name, last_name, email, password, role);
    res.status(200).json({ message: "admin registered successfully" });
  } catch (error) {
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

const getAllUser = async (req, res) => {
  try {
    const [data] = await userModel.getAllUser();
    if (data.length > 0) {
      res.status(200).json({ message: "menampilkan data semua user", data: data });
    } else {
      res.json({
        massage: "Tidak ada user terdaftar",
      });
    }
  } catch (error) {
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

module.exports = {
  addAdmin,
  addUser,
  getAllUser
};
