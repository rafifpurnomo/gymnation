import 'package:flutter/material.dart';
import 'package:project_tubes/login_screen/styles.dart';
import 'package:project_tubes/widget/facility_item_widget.dart';

class FacilitiesPage extends StatelessWidget {
  const FacilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facilities', style: TextStyles.title,),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,), // Ikon kembali
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          children: [
            // Daftar Kelas
            Expanded(
              child: ListView(
                children: const [
                  FacilityItemWidget(
                    title: 'Ruang Penyimpanan',
                    description: '',
                    imageUrl: 'assets/images/locker_room.png',
                  ),
                  FacilityItemWidget(
                    title: 'Kamar mandi',
                    description: '',
                    imageUrl: 'assets/images/bathroom.png',
                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
