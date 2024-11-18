import 'package:e_qurban/app/modules/sensor_mikrofon/controllers/mikrofon_controller.dart';
import 'package:get/get.dart';

class MikrofonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MikrofonController>(
      () => MikrofonController(),
    );
  }
}
