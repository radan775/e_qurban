import 'package:e_qurban/app/modules/controller/auth_controller.dart';
import 'package:e_qurban/app/modules/register/controllers/register_controller.dart';
import 'package:e_qurban/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => RegisterState();
}

class RegisterState extends State<RegisterView> {
  final AuthController auth = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Daftar',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                // keyboardType: TextInputType.number, // Membuka keyboard angka
                // inputFormatters: <TextInputFormatter>[
                //   FilteringTextInputFormatter
                //       .digitsOnly, // Hanya menerima angka
                // ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              const SizedBox(height: 24),
              Obx(() {
                return ElevatedButton(
                  onPressed: auth.isLoading.value
                      ? null
                      : () async {
                          auth.registerUser(
                              emailController.text, passwordController.text);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: auth.isLoading.value
                      ? CircularProgressIndicator()
                      : const Text(
                          'Daftar',
                          style: TextStyle(fontSize: 18),
                        ),
                );
              }),
              const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: const Text(
                    'Sudah memiliki akun? Masuk',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
