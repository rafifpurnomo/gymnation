import 'package:flutter/material.dart';

class FoodMenuItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const FoodMenuItem({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(
          imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Colors.white, size: 16),
                Icon(Icons.star, color: Colors.white, size: 16),
                Icon(Icons.star, color: Colors.white, size: 16),
                Icon(Icons.star, color: Colors.white, size: 16),
                Icon(Icons.star, color: Colors.white, size: 16),
              ],
            ),
            SizedBox(height: 8), // Jarak vertikal antara bintang dan teks
            Text(
              'Klik Info Selengkapnya',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
