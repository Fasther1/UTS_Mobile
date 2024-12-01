import 'package:flutter/material.dart';

import './detail_page.dart' as detail;

void main() {
  runApp(MyNaviAppState());
}

class MyNaviAppState extends StatelessWidget {
  const MyNaviAppState({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App",
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get title => null;

  get desc => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Latihan")),
      body: Center(
          child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => detail.DetailPage(
                            email: "2210631170119@student.unsika.ac.id",
                            nama: "Fakhri Rifqi Fahreza")));
              },
              label: const Text("Pergi ke halaman 2"),
              icon: const Icon(Icons.ramen_dining_rounded))),
    );
  }
}