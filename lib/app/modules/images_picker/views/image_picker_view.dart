import 'package:e_qurban/app/modules/images_picker/controllers/image_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerView extends GetView<ImagePickerController> {
  const ImagePickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Image Picker"),
      ),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.selectedImage.value != null
                  ? Image.file(
                      controller.selectedImage.value!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Icon(
                      Icons.image,
                      size: 200,
                      color: Colors.grey[400],
                    ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => controller.pickImage(ImageSource.camera),
                    icon: const Icon(Icons.camera),
                    label: const Text("Camera"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () => controller.pickImage(ImageSource.gallery),
                    icon: const Icon(Icons.photo),
                    label: const Text("Gallery"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: controller.clearImage,
                icon: const Icon(Icons.delete),
                label: const Text("Clear Image"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: controller.uploadImage,
                icon: const Icon(Icons.upload),
                label: const Text("Upload Image"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ],
          );
        }),
      ),
    );
  }
}
