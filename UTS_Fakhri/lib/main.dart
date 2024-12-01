import 'package:flutter/material.dart';
//#TODO_13 Import 3 halaman navbar yang telah dibuat
import 'navbarpage1.dart';
import 'navbarpage2.dart';
import 'navbarpage3.dart';
import 'detail_page.dart'; 

//#TODO_14 Buat function main dan jalankan aplikasi
void main() {
  runApp(const fakhriganteng());
}

//#TODO_1 Atur nama statelessWidget Class
class fakhriganteng extends StatelessWidget {
  const fakhriganteng({super.key});

  //#TODO_3 Bangun MaterialApp dan Arahkan property home ke statefulWidget Class
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Navigation bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

//#TODO_2 Atur nama statefulWidget Class
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; 

  //#TODO_4 Daftar halaman
  final List<Widget> _pages = const [
    NamaBottomNavBar1(),
    NamaBottomnavBar2(),
    NamaBottomNavBar3(),
  ];

  //#TODO_5 Fungsi untuk memperbarui halaman yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    //#TODO_6 Bangun Scaffold
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Bottom Navigation Bar'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileDetailPage()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
