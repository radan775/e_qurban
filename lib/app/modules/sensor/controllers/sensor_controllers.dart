// controllers/sensor_controller.dart
import 'package:get/get.dart';

class SensorController extends GetxController {
  // Misalnya, kita bisa menambah logika untuk memilih sensor
  void navigateToCamera() {
    Get.toNamed('/kamera');
  }

  void navigateToMicrophone() {
    Get.toNamed('/mikrofon');
  }

  void navigateToSpeaker() {
    Get.toNamed('/speaker');
  }
}