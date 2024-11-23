const transporter = require("../config/mail.config");
const userModel = require("../model/user");
const jwt = require("jsonwebtoken");

const addPelanggan = async (req, res) => {
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

const addUser = async (req, res) => {
  const { first_name, last_name, email, password, role } = req.body;

  try {
    const [cekUser] = await userModel.searchByEmail(email);

    if (cekUser.length > 0) {
      return res.status(400).json({
        message: "email sudah terdaftar",
        success: false,
      });
    }

    await userModel.addPelanggan(first_name, last_name, email, password, role);
    res.status(200).json({ message: "user registered successfully" });
  } catch (error) {
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

const getAllUser = async (req, res) => {
  try {
    const [data] = await userModel.getAllUser();
    if (data.length > 0) {
      res
        .status(200)
        .json({ message: "menampilkan data semua user", data: data });
    } else {
      res.json({
        massage: "Tidak ada user terdaftar",
      });
    }
  } catch (error) {
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

const changePassword = async (req, res) => {
  const { id_user, newPass } = req.body;
  try {
    await userModel.changePassword(id_user, newPass);
    res.json({
      success: true,
      massage: "password berhasil diubah",
    });
  } catch (error) {
    res
      .status(500)
      .json({ success: false, message: "Server error", error: error.message });
  }
};

const forgetPassword = async (req, res) => {
  const { email } = req.body;

  try {
    const [userRows] = await userModel.searchByEmail(email);
    const user = userRows[0];

    if (!user) {
      return res
        .status(404)
        .json({ success: false, message: "Email tidak ditemukan." });
    }

    const token = jwt.sign({ id: user.id_user }, process.env.JWT_SECRET, {
      expiresIn: "15m",
    });

    const resetLink = `http://127.0.0.1:8000/resetPassword/${token}`;

    const mailOptions = {
      from: process.env.AUTH_EMAIL,
      to: email,
      subject: "Reset Password",
      html: `
        <h2>Anda telah meminta untuk mengatur ulang password.
            Klik link berikut untuk mengatur ulang password Anda:</h2>
        <h3>Link ini hanya berlaku selama 15 menit.</h3>
        <a href="${resetLink}">${resetLink}</a>
      `,
    };

    await transporter.sendMail(mailOptions);
    res.status(200).json({
      success: true,
      token: token,
      message: "Email reset password telah dikirim.",
    });
  } catch (error) {
    console.error("Error mengirim email reset password:", error);
    res
      .status(500)
      .json({ success: false, message: "Server error", error: error.message });
  }
};

const deleteUser = async (req, res) => {
  const { id_user } = req.params;
  console.log(id_user);

  try {
    const result = await userModel.deleteUser(id_user);
    if (result[0].affectedRows === 0) {
      return res
        .status(404)
        .json({ succes: false, message: "data user tidak ditemukan" });
    }
    res.status(200).json({ succes: true, message: "data user dihapus" });
  } catch (error) {
    res
      .status(500)
      .json({ succes: false, message: "Server error", error: error.message });
  }
};

const updateProfile = async (req, res) => {
  const { id_user } = req.params;
  const {first_name, last_name, email} = req.body;

  try {
    await userModel.updateProfile(id_user, first_name, last_name, email);
    res.status(200).json({ succes: true, message: "data user diperbarui" });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      message: "Terjadi kesalahan saat memperbarui profil.",
      succes: false,
      serverMessage: error.message,
    });
  }
};

module.exports = {
  addPelanggan,
  addUser,
  getAllUser,
  changePassword,
  forgetPassword,
  deleteUser,
  updateProfile
};
