import 'package:flutter/material.dart';

class KameraPage extends StatelessWidget {
  const KameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamera Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Tambahkan logika untuk membuka kamera di sini
            print("Kamera diaktifkan");
          },
          child: const Text("Buka Kamera"),
        ),
      ),
    );
  }
}
