const transporter = require("../config/mail.config");
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
      massage: "password berhasil diubah",
    });
  } catch (error) {
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

const forgetPassword = async (req, res) => {
  const { email } = req.body;

  try {
    const user = await userModel.searchByEmail(email);
    if (!user) {
      return res.status(404).json({ message: "Email tidak ditemukan." });
    }

    const resetLink = "https://daniellieandri21.github.io/Gymnation/";

    const mailOptions = {
      from: process.env.AUTH_EMAIL,
      to : email,
      subject: "Reset Password",
      html: `<p>Anda telah meminta untuk mengatur ulang password. Klik link berikut untuk mengatur ulang password Anda:</p>
             <a href="${resetLink}">${resetLink}</a>
             <p>Link ini hanya berlaku selama 15 menit.</p>`,
    };

    // const RS = 
    await transporter.sendMail(mailOptions);
    res.status(200).json({ message: "Email reset password telah dikirim." });
  } catch (error) {
    console.error("Error mengirim email reset password:", error);
    res.status(500).json({ message: "Server error", error: error.message });
  }
};

module.exports = {
  addAdmin,
  addUser,
  getAllUser,
  changePassword,
  forgetPassword,
};
