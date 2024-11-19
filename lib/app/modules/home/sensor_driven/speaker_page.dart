import 'package:flutter/material.dart';

class SpeakerPage extends StatelessWidget {
  const SpeakerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speaker Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Tambahkan logika untuk mengakses speaker di sini
            print("Speaker diaktifkan");
          },
          child: const Text("Tes Speaker"),
        ),
      ),
    );
  }
}