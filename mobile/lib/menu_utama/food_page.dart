import 'package:flutter/material.dart';
import 'package:project_tubes/login_screen/styles.dart';
import 'package:project_tubes/widget/foodmenu_item.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthy Food', style: TextStyles.title,),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,), // Ikon kembali
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Container(
        width: double.infinity, // Mengisi lebar penuh
        height: double.infinity, // Mengisi tinggi penuh
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade700, Colors.grey.shade900,],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header image and restaurant description
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0), // Sesuaikan radius sesuai kebutuhan
                    child: Image.asset(
                      'assets/images/healthy-food.png', // Ganti dengan URL gambar Anda
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                  const Positioned(
                    left: 16,
                    bottom: 16,
                    child: Text(
                      'Healthy Food',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Healthy Food atau makanan sehat adalah jenis makanan yang memberikan manfaat nutrisi bagi tubuh dan mendukung kesehatan secara keseluruhan. Makanan ini biasanya kaya akan vitamin, mineral, serat, dan antioksidan, serta rendah akan gula, garam, dan lemak jenuh.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,// Menambahkan fontWeight untuk membuat teks bold
                ),
              ),
              const SizedBox(height: 24),
              // Food Menu Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Food Menu',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Tambahkan aksi untuk 'Selengkapnya'
                    },
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Food Menu List
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Berbagai Macam Buah',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Buah-buahan adalah sumber vitamin, serat, dan mineral yang baik. Mengkonsumsi buah setiap hari dapat membantu menjaga kesehatan tubuh dan mendukung sistem kekebalan tubuh.',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Tutup', style: TextStyle(color: Colors.orange)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const FoodMenuItem(
                  name: 'Berbagai Macam Buah',
                  imageUrl: 'assets/images/buah.png',
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Berbagai Macam Sayur',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Sayuran merupakan makanan kaya serat, vitamin, dan mineral yang penting bagi kesehatan tubuh. Konsumsi sayuran setiap hari dapat membantu meningkatkan sistem kekebalan tubuh dan menjaga kesehatan pencernaan.',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Tutup', style: TextStyle(color: Colors.orange)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const FoodMenuItem(
                  name: 'Berbagai Macam Sayur',
                  imageUrl: 'assets/images/sayur.png',
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Dada Ayam',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Dada ayam adalah bagian daging ayam yang paling populer karena rendah lemak dan tinggi protein. Dada ayam biasanya dijual tanpa tulang dan kulit, sehingga menjadi pilihan utama bagi mereka yang ingin menjaga pola makan sehat atau meningkatkan massa otot.',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Tutup', style: TextStyle(color: Colors.orange)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const FoodMenuItem(
                  name: 'Dada Ayam',
                  imageUrl: 'assets/images/dada-ayam.png',
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Salad',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Salad adalah hidangan yang biasanya terdiri dari campuran berbagai sayuran segar seperti selada, tomat, mentimun, wortel, dan paprika. Kadang-kadang, salad juga dilengkapi dengan buah-buahan, kacang-kacangan, keju, atau sumber protein seperti ayam, telur, atau ikan. Dressing (saus) seperti vinaigrette, yogurt, atau minyak zaitun sering ditambahkan untuk memberikan rasa.',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Tutup', style: TextStyle(color: Colors.orange)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const FoodMenuItem(
                  name: 'Salad',
                  imageUrl: 'assets/images/salad.png',
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Oats',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Oats adalah biji-bijian utuh yang berasal dari tanaman gandum (Avena sativa) dan sering dijadikan pilihan sarapan sehat. Oats biasanya diolah menjadi oatmeal atau digunakan sebagai bahan dalam granola dan roti. Oats mengandung serat tinggi, khususnya beta-glukan, yang baik untuk kesehatan jantung.',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Tutup', style: TextStyle(color: Colors.orange)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const FoodMenuItem(
                  name: 'Oats',
                  imageUrl: 'assets/images/oats.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
