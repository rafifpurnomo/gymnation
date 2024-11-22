import 'package:flutter/material.dart';
import 'package:gymnation/api/meAPI.dart';
import 'package:gymnation/widget/account_widget.dart'; // Import widget terpisah
import 'package:gymnation/login_screen/login_screen.dart';

class AccountPage extends StatefulWidget {
  final bool isSearching;
  final String searchQuery;
  final ValueChanged<String> onSearchQueryChanged;

  const AccountPage({
    super.key,
    required this.isSearching,
    required this.searchQuery,
    required this.onSearchQueryChanged,
  });

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final meAPI meapi = meAPI();
  var user; // Untuk menyimpan data pengguna
  bool isLoading = true; // Untuk menampilkan indikator loading
  @override
  void initState() {
    super.initState();
    initUser(); // Panggil fungsi untuk mengambil data user
    print(user);
  }

  Future<void> initUser() async {
    try {
      var response = await meapi.getUserProfile();
      if (response['status'] == true && response['data'] != null) {
        setState(() {
          user = response['data'];
          isLoading = false;
        });
      } else {
        print("Failed to retrieve user data: ${response['message']}");
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey.shade700, Colors.grey.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator()) // Indikator loading
            : Column(
                children: [
                  if (widget.isSearching)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: widget.onSearchQueryChanged,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Cari Akun atau Pengaturan...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 157, 0),
                          Color.fromARGB(255, 248, 145, 1)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: user != null &&
                                  user![0][0]['img_path'] != null
                              ? NetworkImage(user![0][0]['img_path'])
                              : const AssetImage(
                                      'assets/images/icon-appbar.jpg')
                                  as ImageProvider, // Gambar default jika tidak ada foto
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user != null
                                  ? user![0][0]['first_name'] +
                                          user![0][0]['last_name'] ??
                                      'Nama Tidak Diketahui'
                                  : 'Loading...',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              user != null
                                  ? user![0][0]['email'] ??
                                      'Email Tidak Diketahui'
                                  : '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: user != null &&
                                  user![0][0]['profile_picture'] != null
                              ? Colors.green // Jika foto ada
                              : Colors.red, // Jika foto tidak ada
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        MenuItemWidget(
                          icon: Icons.person,
                          title: 'View Profile',
                          onTap: () {},
                        ),
                        MenuItemWidget(
                          icon: Icons.settings,
                          title: 'Settings',
                          onTap: () {},
                        ),
                        const Divider(),
                        MenuItemWidget(
                          icon: Icons.support_agent,
                          title: 'Support',
                          onTap: () {},
                        ),
                        const Divider(),
                        MenuItemWidget(
                          icon: Icons.logout,
                          title: 'Sign Out',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
