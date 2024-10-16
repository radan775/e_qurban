import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var phoneNumber = ''.obs;
  var password = ''.obs;
  var isPasswordHidden = true.obs;

  // List berisi pasangan nomor HP dan password yang valid
  final List<Map<String, String>> validCredentials = [
    {'phoneNumber': '00,123', 'password': 'kelek,ww'},
    {'phoneNumber': '081234567890', 'password': 'password123'},
    {'phoneNumber': '087654321098', 'password': 'mypassword'},
  ];

  void login() async {
    if (phoneNumber.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Nomor Hp dan password tidak boleh kosong');
      return;
    }

    // Debug log untuk melihat input yang dimasukkan
    print('Input Phone Number: ${phoneNumber.value}');
    print('Input Password: ${password.value}');

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulasi proses login
    isLoading.value = false;

    // Validasi input dengan daftar validCredentials
    bool isValid = validCredentials.any((credential) =>
        credential['phoneNumber'] == phoneNumber.value &&
        credential['password'] == password.value);

    if (isValid) {
      print('Login berhasil'); // Debug: Menunjukkan login berhasil
      Get.offNamed('/home');
    } else {
      print('Login gagal'); // Debug: Menunjukkan login gagal
      Get.snackbar('Error', 'Nomor Hp atau password salah');
    }
  }
}
