import 'package:e_qurban/app/modules/sensor_kamera/controllers/kamera_controller.dart';
import 'package:get/get.dart';

class KameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KameraController>(
      () => KameraController(),
    );
  }
}
