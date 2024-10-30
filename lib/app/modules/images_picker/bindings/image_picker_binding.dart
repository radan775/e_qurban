import 'package:e_qurban/app/modules/images_picker/controllers/image_picker_controller.dart';
import 'package:get/get.dart';

class ImagePickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImagePickerController>(
      () => ImagePickerController(),
    );
  }
}
