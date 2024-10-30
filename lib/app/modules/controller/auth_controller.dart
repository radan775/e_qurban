import 'package:e_qurban/app/modules/home/views/home_view.dart';
import 'package:e_qurban/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  Future<UserCredential?> loginWithGoogle() async {
    isLoading.value = true;
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        isLoading.value = false;
        return null;
      }

      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

      await Future.delayed(Duration(milliseconds: 300));
      isLoading.value = false;
      // Get.toNamed(Routes.HOME);
      return await auth.signInWithCredential(cred);
    } catch (e) {
      print("Login failed: $e");
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> registerUser(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Error', 'Registration failed',
          backgroundColor: Colors.red);
    } catch (e) {
      Get.snackbar('Success', 'Registration Succes',
          backgroundColor: Colors.green);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUser(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Error', 'Login failed',
          backgroundColor: Colors.red);

    } catch (e) {
      Get.snackbar('Success', 'Login Successful',
          backgroundColor: Colors.green);
    } finally {
      isLoading.value = false;
    }
  }
}
