import 'package:e_qurban/app/modules/sensor/controllers/sensor_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SensorView extends GetView<SensorController> {
  const SensorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor Options'),
        elevation: 4,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Sensor Kamera
            _buildSectionTitle('Sensor Kamera'),
            _buildSensorTile(
              title: 'Camera',
              onTap: () => Get.toNamed('/kamera'), // Navigasi ke KameraView
            ),
            const SizedBox(height: 16),
            
            // Sensor Mikrofon
            _buildSectionTitle('Sensor Mikrofon'),
            _buildSensorTile(
              title: 'Microphone',
              onTap: () => Get.toNamed('/mikrofon'), // Navigasi ke MikrofonView
            ),
            const SizedBox(height: 16),

            // Sensor Speaker
            _buildSectionTitle('Sensor Speaker'),
            _buildSensorTile(
              title: 'Speaker',
              onTap: () => Get.toNamed('/speaker'), // Navigasi ke SpeakerView
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget untuk Membuat Title Section
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Membuat Widget Tombol dengan Card dan ElevatedButton
  Widget _buildSensorTile({required String title, required Function() onTap}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.teal.shade50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
