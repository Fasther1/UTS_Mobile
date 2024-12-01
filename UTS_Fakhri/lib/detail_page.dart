import 'package:flutter/material.dart';

class ProfileDetailPage extends StatefulWidget {
  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Pengguna"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Bagian gambar profil menggunakan CircleAvatar
            CircleAvatar(
              radius: 70,  // Menentukan ukuran gambar profil
              backgroundImage: const AssetImage('assets/1.jpg'),  // Gambar profil
              backgroundColor: Colors.grey[300],  // Warna latar belakang jika gambar tidak ada
            ),
            const SizedBox(height: 16),

            // Nama pengguna
            const Text(
              "Fakhri Rifqi Fahreza",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Bio pengguna
            const Text(
              "Flutter Developer | Tech Enthusiast | Learning Every Day",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Tombol aksi
            ElevatedButton(
              onPressed: () {
                // Aksi untuk mengedit profil
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Fitur Edit Profil Belum Tersedia')),
                );
              },
              child: const Text("Edit Profil"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Mengubah warna tombol
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                // Aksi untuk melihat teman
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Fitur Teman Belum Tersedia')),
                );
              },
              child: const Text("Lihat Teman"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Mengubah warna tombol
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                // Aksi untuk logout
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Fitur Logout Belum Tersedia')),
                );
              },
              child: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Mengubah warna tombol logout
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:  BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Cari",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
        currentIndex: 0,
        onTap: null, // Navigasi sesuai indeks (masih kosong)
      ),
    );
  }
}
