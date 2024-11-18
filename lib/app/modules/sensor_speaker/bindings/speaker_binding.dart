import 'package:e_qurban/app/modules/sensor_speaker/controllers/speaker_controller.dart';
import 'package:get/get.dart';

class SpeakerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpeakerController>(
      () => SpeakerController(),
    );
  }
}
