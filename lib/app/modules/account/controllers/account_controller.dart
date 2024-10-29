import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.value = auth.currentUser; 
  }

  Future<void> logout() async {
    await GoogleSignIn().signOut();
    await auth.signOut();
    Get.offAllNamed('/login');
  }
}
