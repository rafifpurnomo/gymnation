import 'package:flutter/material.dart';
import 'package:project_tubes/login_screen/styles.dart';
import 'package:project_tubes/widget/discount_item.dart';

class DiscountsPage extends StatelessWidget {
  const DiscountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discounts', style: TextStyles.title,),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,), // Ikon kembali
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      // Tambahkan Container dengan dekorasi gradient
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade700, Colors.grey.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Potongan Harga Terbaru',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Mengubah warna teks agar kontras dengan background gradient
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Nikmati potongan harga hingga 50% untuk produk pilihan setiap bulannya. Berikut adalah beberapa penawaran menarik:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white, // Mengubah warna teks agar kontras dengan background gradient
                ),
              ),
              const SizedBox(height: 16.0),
              // Daftar diskon
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    DiscountItem(title: 'Diskon Makanan Sehat', discount: '50%'),
                    DiscountItem(title: 'Potongan Harga Kelas', discount: '30%'),
                    DiscountItem(title: 'Diskon Pembelian Paket', discount: '20%'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
