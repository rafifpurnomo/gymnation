import 'package:flutter/material.dart';
import 'package:project_tubes/login_screen/styles.dart';
import 'package:project_tubes/widget/class_item_widget.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class', style: TextStyles.title,),
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
            const SizedBox(height: 20),
            // Daftar Kelas
            Expanded(
              child: ListView(
                children: const [
                  ClassItem(
                    title: 'YOGA',
                    schedule: 'Senin, Kamis, Sabtu',
                    members: '20 Orang',
                    icon: Icons.fitness_center,
                  ),
                  ClassItem(
                    title: 'MUAY THAI',
                    schedule: 'Selasa, Rabu',
                    members: '10 Orang',
                    icon: Icons.fitness_center,
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
