// binding/sensor_binding.dart
import 'package:e_qurban/app/modules/sensor/controllers/sensor_controllers.dart';
import 'package:get/get.dart';

class SensorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SensorController>(() => SensorController());
  }
}
