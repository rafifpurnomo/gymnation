import 'package:project_tubes/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:project_tubes/login_screen/styles.dart';
import 'package:project_tubes/menu_utama/home_page.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final emailLoginController = TextEditingController(); // Controller untuk email login
    final emailRegisterController = TextEditingController(); // Controller untuk email register
    final passwordLoginController = TextEditingController();
    final passwordRegisterController = TextEditingController();
    final confirmPasswordController = TextEditingController(); // Controller untuk Confirm Password
    bool isObscureLoginPassword = true; // Untuk password login
    bool isObscureRegisterPassword = true; // Untuk password register
    bool isObscureConfirmPassword = true; // Untuk Confirm Password
     // Simulasi fungsi login
    void _login() {
    // Saat tombol "Login" ditekan, lakukan navigasi ke HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Mencegah konten naik saat keyboard muncul
      appBar: AppBar(
        //untuk judul paling atas
        title: Text(
          'Login',
          style: TextStyles.title,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width, // Lebar layar penuh
        height: MediaQuery.of(context).size.height, // Tinggi layar penuh
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-image.png'), // Pastikan path gambar sudah benar
            fit: BoxFit.cover, // Mengatur gambar agar memenuhi seluruh layar
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.6), // Warna atas (transparan)
                      Colors.black.withOpacity(0.3), // Warna bawah (transparan)
                    ],
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/login-image.png'), // untuk memasukkan gambar
                  const SizedBox(height: 24),
                  Text(
                    'Login', // buat sub judul
                    style: TextStyles.title.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 24),
                  // Fungsi memanggil custom teks field untuk login
                  CustomTextfield(
                    controller: emailLoginController,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hint: 'Email or Username',
                  ),
                  const SizedBox(height: 16),
                  CustomTextfield(
                    controller: passwordLoginController,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    hint: 'Password',
                    isObscure: isObscureLoginPassword, // Ubah sesuai field
                    hasSuffix: true,
                    onPressed: () {
                      setState(() {
                        isObscureLoginPassword = !isObscureLoginPassword; // Toggle untuk Password Login
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  Text('Forgot Password ?', style: TextStyles.title),
                  const SizedBox(height: 24),
                  // Button login
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[600], // background
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // border radius
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Login',
                        style: TextStyles.title.copyWith(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Don\'t have an account ?',
                    style: TextStyles.title.copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Memunculkan modal bottom sheet saat teks "Sign Up" ditekan
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Wrap(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(25),
                                          topLeft: Radius.circular(25),
                                        ),
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 16), // Gantilah dengan `defaultMargin` jika sudah didefinisikan
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 25),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Hallo...",
                                                      style: TextStyles.body.copyWith(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Register",
                                                      style: TextStyles.body.copyWith(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 30,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(), // Letakkan di sini untuk membuat jarak antara Column dan Image
                                                Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Ketika ikon ditekan
                                                      Navigator.pop(context);
                                                    },
                                                    child: Image.asset(
                                                      'assets/images/close.png',
                                                      height: 30,
                                                      width: 70,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Untuk Register
                                            const SizedBox(height: 25),
                                            CustomTextfield(
                                              controller: emailRegisterController,
                                              textInputType: TextInputType.emailAddress,
                                              textInputAction: TextInputAction.next,
                                              hint: 'info@example.com',
                                            ),
                                            const SizedBox(height: 16),
                                            CustomTextfield(
                                              controller: TextEditingController(), // Menggunakan controller yang berbeda
                                              textInputType: TextInputType.text,
                                              textInputAction: TextInputAction.next,
                                              hint: 'Username',
                                            ),
                                            const SizedBox(height: 16),
                                            CustomTextfield(
                                              controller: passwordRegisterController,
                                              textInputType: TextInputType.visiblePassword,
                                              textInputAction: TextInputAction.next,
                                              hint: 'Password',
                                              isObscure: isObscureRegisterPassword, // Ubah sesuai field
                                              hasSuffix: true,
                                              onPressed: () {
                                                setState(() {
                                                  isObscureRegisterPassword = !isObscureRegisterPassword; // Toggle untuk Password Register
                                                });
                                              },
                                            ),
                                            const SizedBox(height: 16),
                                            CustomTextfield(
                                              controller: confirmPasswordController, // Menggunakan controller yang berbeda untuk Confirm Password
                                              textInputType: TextInputType.visiblePassword,
                                              textInputAction: TextInputAction.done,
                                              hint: 'Confirm Password',
                                              isObscure: isObscureConfirmPassword, // Ubah sesuai field
                                              hasSuffix: true,
                                              onPressed: () {
                                                setState(() {
                                                  isObscureConfirmPassword = !isObscureConfirmPassword; // Toggle untuk Confirm Password
                                                });
                                              },
                                            ),
                                            const SizedBox(height: 16),
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.orange[600], // background
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5), // border radius
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 16),
                                                child:InkWell(
                                                    onTap: () {
                                                      // Ketika ikon ditekan
                                                      Navigator.pop(context);
                                                    },
                                                  child: Text(
                                                    'Register',
                                                    style: TextStyles.title.copyWith(fontSize: 20, color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Already have an account?", 
                                                  style: TextStyles.title.copyWith(fontSize: 18),
                                                ),
                                                const SizedBox(width: 8), // Jarak antara dua teks
                                                InkWell(
                                                  onTap: () {
                                                    // Ketika "Log in" ditekan
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Log in", 
                                                    style: TextStyles.title.copyWith(
                                                      fontSize: 18, 
                                                      color: Colors.orange, // Tambahkan warna agar terlihat seperti link
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyles.body.copyWith(fontSize: 18, color: AppColors.orange),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          )
        ]
      )
    )
  );
  }       
}