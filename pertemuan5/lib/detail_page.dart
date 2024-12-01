// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  String nama;
  String email;
  DetailPage({
    super.key,
    required this.email,
    required this.nama,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Halaman Detail",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nama,
              style: const TextStyle(fontSize: 25, letterSpacing: 3),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(email),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: const Text("Kembali ke halaman 1"),
                icon: const Icon(Icons.transit_enterexit_outlined))
          ],
        ),
      ),
    );
  }
}