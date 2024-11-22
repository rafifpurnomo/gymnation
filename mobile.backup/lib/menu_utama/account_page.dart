import 'package:flutter/material.dart';
import 'package:project_tubes/widget/account_widget.dart'; // Import widget terpisah
import 'package:project_tubes/login_screen/login_screen.dart';

class AccountPage extends StatelessWidget {
  final bool isSearching; // Tambahkan parameter isSearching
  final String searchQuery; // Tambahkan parameter searchQuery
  final ValueChanged<String> onSearchQueryChanged; // Tambahkan handler untuk perubahan query

  const AccountPage({
    super.key,
    required this.isSearching,
    required this.searchQuery,
    required this.onSearchQueryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.shade700,
            Colors.grey.shade900,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Background Scaffold dibuat transparan
        body: Column(
          children: [
            // Jika pencarian aktif, tampilkan TextField
            if (isSearching)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: onSearchQueryChanged,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white, // Warna background putih
                    hintText: 'Cari Akun atau Pengaturan...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
            // Bagian Header untuk Profil
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 255, 157, 0), Color.fromARGB(255, 248, 145, 1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Row(
                children: [
                  // Foto Profil
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/icon-appbar.jpg'), // Gambar profil
                  ),
                  SizedBox(width: 16),
                  // Info Pengguna
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Godzilla D. White',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'gymnation@gmail.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  // Indikator Status Online
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                ],
              ),
            ),
            // Daftar Menu Akun
            Expanded(
              child: ListView(
                children: [
                  MenuItemWidget(
                    icon: Icons.person,
                    title: 'View Profile',
                    onTap: () {
                      // Aksi saat item diklik
                    },
                  ),
                  MenuItemWidget(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {
                      // Aksi saat item diklik
                    },
                  ),
                  const Divider(),
                  MenuItemWidget(
                    icon: Icons.support_agent,
                    title: 'Support',
                    onTap: () {
                      // Aksi saat item diklik
                    },
                  ),
                  const Divider(),
                  MenuItemWidget(
                    icon: Icons.logout,
                    title: 'Sign Out',
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );// Aksi saat item diklik
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
