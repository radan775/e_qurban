import 'package:e_qurban/app/modules/account/controllers/account_controller.dart';
import 'package:get/get.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
  }
}
