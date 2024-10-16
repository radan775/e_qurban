import 'package:e_qurban/app/modules/iniwebview/controllers/iniwebview_controller.dart';
import 'package:get/get.dart';

class IniwebviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IniWebViewController>(
      () => IniWebViewController(),
    );
  }
}
