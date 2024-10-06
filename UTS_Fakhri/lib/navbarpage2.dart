import 'package:flutter/material.dart';

//#TODO_9 Atur nama statefulWidget class untuk bottom navbar kedua
class NamaBottomnavBar2 extends StatefulWidget {
  const NamaBottomnavBar2({super.key});

  @override
  State<NamaBottomnavBar2> createState() => _NamaBottomNavBar2State();
}

class _NamaBottomNavBar2State extends State<NamaBottomnavBar2> {
  //#TODO_10 Bangun tampilan pada bottom navbar kedua berbentuk row dan column dengan tampilan 2 baris dan minimal 5 kolom
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navbar Kedua'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 40),
                    Text(items[index]),
                  ],
                );
              }),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite, size: 40),
                    Text(items[index + 5]),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
