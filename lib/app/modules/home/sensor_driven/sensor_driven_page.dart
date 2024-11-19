import 'package:e_qurban/app/modules/sensor_kamera/views/kamera_views.dart';
import 'package:e_qurban/app/modules/sensor_mikrofon/views/mikrofon_views.dart';
import 'package:e_qurban/app/modules/sensor_speaker/views/speaker_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SensorDrivenPage extends StatelessWidget {
  const SensorDrivenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor Driven'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => const KameraView());
              },
              child: const Text("Buka Kamera"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const MikrofonView());
              },
              child: const Text("Gunakan Mikrofon"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const SpeakerView());
              },
              child: const Text("Tes Speaker"),
            ),
          ],
        ),
      ),
    );
  }
}
