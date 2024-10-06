import 'package:flutter/material.dart';

//#TODO_11 Atur nama statefulWidget class untuk bottom navbar ketiga
class NamaBottomNavBar3 extends StatefulWidget {
  const NamaBottomNavBar3({super.key});

  @override
  State<NamaBottomNavBar3> createState() => _NamaBottomNavBar3State();
}

class _NamaBottomNavBar3State extends State<NamaBottomNavBar3> {
  //#TODO_12 Bangun tampilan pada bottom navbar ketiga 
  // berbentuk halaman profil berisi foto pribadi yang dibungkus dengan frame lingkaran,
  // nama lengkap, dan email UNSIKA
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50, 
              backgroundImage: AssetImage('assets/1.jpg')
            ),
            const SizedBox(height: 16), 
            const Text(
              'Fakhri Rifqi Fahreza',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8), 
            const Text(
              '2210631170119@student.unsika.ac.id', 
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
