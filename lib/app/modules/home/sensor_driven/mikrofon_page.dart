import 'package:flutter/material.dart';

class MikrofonPage extends StatelessWidget {
  const MikrofonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mikrofon Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Tambahkan logika untuk mengakses mikrofon di sini
            print("Mikrofon diaktifkan");
          },
          child: const Text("Gunakan Mikrofon"),
        ),
      ),
    );
  }
}
