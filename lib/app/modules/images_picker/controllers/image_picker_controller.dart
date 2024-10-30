import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class ImagePickerController extends GetxController {
  final Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
    print("ini image${selectedImage.value}");
  }

  void clearImage() {
    selectedImage.value = null;
  }

  Future<void> uploadImage() async {
    if (selectedImage.value == null) {
      print('Pilih gambar terlebih dahulu.');
      return;
    }

    String fileName = basename(selectedImage.value!.path);

    try {
      final storageRef = FirebaseStorage.instance.ref().child(fileName);

      await storageRef.putFile(selectedImage.value!);

      String downloadUrl = await storageRef.getDownloadURL();
      print('File berhasil diupload. URL: $downloadUrl');
    } catch (e) {
      print('Terjadi error saat upload: $e');
    }
  }
}
