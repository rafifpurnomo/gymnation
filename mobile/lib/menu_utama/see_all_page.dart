import 'package:flutter/material.dart';
import 'package:project_tubes/login_screen/styles.dart';
import 'package:project_tubes/menu_utama/food_page.dart';
import 'package:project_tubes/menu_utama/class_page.dart';
import 'package:project_tubes/menu_utama/discount_page.dart';
import 'package:project_tubes/menu_utama/facility_page.dart';
import 'package:project_tubes/widget/all_list_item.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('See All', style: TextStyles.title),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Ikon kembali
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade700, Colors.grey.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 4, // Jumlah item yang sesuai
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return const ListItemWidget(
                  icon: Icons.restaurant,
                  title: 'Makanan',
                  subtitle: 'Lihat berbagai pilihan makanan sehat.', // Deskripsi
                  page: FoodPage(), // Halaman tujuan
                  backgroundColor: Colors.orange, // Warna latar belakang
                  iconColor: Colors.white, // Warna ikon
                  titleColor: Colors.white, // Warna judul
                  subtitleColor: Colors.white, // Warna subtitle
                );
              case 1:
                return const ListItemWidget(
                  icon: Icons.list,
                  title: 'Fasilitas',
                  subtitle: 'Temukan fasilitas yang tersedia di sini.', // Deskripsi
                  page: FacilitiesPage(),
                  backgroundColor: Colors.orange, // Warna latar belakang
                  iconColor: Colors.white, // Warna ikon
                  titleColor: Colors.white, // Warna judul
                  subtitleColor: Colors.white, // Warna subtitle
                );
              case 2:
                return const ListItemWidget(
                  icon: Icons.percent,
                  title: 'Diskon',
                  subtitle: 'Cek promo dan diskon menarik.', // Deskripsi
                  page: DiscountsPage(),
                  backgroundColor: Colors.orange, // Warna latar belakang
                  iconColor: Colors.white, // Warna ikon
                  titleColor: Colors.white, // Warna judul
                  subtitleColor: Colors.white, // Warna subtitle
                );
              case 3:
                return const ListItemWidget(
                  icon: Icons.event_note,
                  title: 'Kelas',
                  subtitle: 'Daftar kelas yang tersedia untuk Anda.', // Deskripsi
                  page: ClassPage(),
                  backgroundColor: Colors.orange, // Warna latar belakang
                  iconColor: Colors.white, // Warna ikon
                  titleColor: Colors.white, // Warna judul
                  subtitleColor: Colors.white, // Warna subtitle
                );
              default:
                return const SizedBox(); // Jika tidak ada item yang cocok
            }
          },
        ),
      ),
    );
  }
}
