import 'package:e_qurban/app/modules/sensor_mikrofon/controllers/mikrofon_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MikrofonView extends GetView<MikrofonController> {
  const MikrofonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speech to Text Example"),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card untuk menampilkan teks hasil pengenalan suara
            Obx(() => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      controller.text.value.isEmpty
                          ? "Say something..."
                          : controller.text.value,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
            const SizedBox(height: 30),

            // Indikator mendengarkan
            Obx(() => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 10,
                  width: controller.isListening.value ? 100 : 0,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: controller.isListening.value
                        ? Colors.green
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                )),

            const SizedBox(height: 30),

            // Tombol start/stop listening
            Obx(() => ElevatedButton.icon(
                  onPressed: controller.isListening.value
                      ? controller.stopListening
                      : controller.startListening,
                  icon: Icon(
                    controller.isListening.value ? Icons.mic_off : Icons.mic,
                  ),
                  label: Text(
                    controller.isListening.value
                        ? "Stop Listening"
                        : "Start Listening",
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                    backgroundColor: controller.isListening.value
                        ? Colors.redAccent
                        : Colors.blueAccent,
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
