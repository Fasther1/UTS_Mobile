import 'package:flutter/material.dart';

//#TODO_7 Atur nama statefulWidget class untuk bottom navbar pertama
class NamaBottomNavBar1 extends StatefulWidget {
  const NamaBottomNavBar1({super.key});

  @override
  State<NamaBottomNavBar1> createState() => _NamaBottomNavBar1State();
}

class _NamaBottomNavBar1State extends State<NamaBottomNavBar1> {
  //#TODO_8 Bangun tampilan pada bottom navbar pertama berbentuk listtile minimal 15 list
  final List<String> items = List.generate(15, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navbar Pertama'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Anda menekan ${items[index]}')),
              );
            },
          );
        },
      ),
    );
  }
}
