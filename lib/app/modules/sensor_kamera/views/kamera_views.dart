import 'dart:io';

import 'package:e_qurban/app/modules/sensor_kamera/controllers/kamera_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class KameraView extends GetView<KameraController> {
  const KameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image & Video Picker'),
        elevation: 4,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // **Image Display Section**
              _buildSectionTitle('Selected Image'),
              Obx(() {
                return controller.isImageLoading.value
                    ? const CircularProgressIndicator()
                    : controller.selectedImagePath.value.isEmpty
                        ? _buildPlaceholder('No image selected')
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.file(
                              File(controller.selectedImagePath.value),
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                            ),
                          );
              }),
              const SizedBox(height: 16),
              _buildButtonRow(
                firstButton: _buildElevatedButton(
                  label: 'From Camera',
                  icon: Icons.camera_alt,
                  onPressed: () => controller.pickImage(ImageSource.camera),
                ),
                secondButton: _buildElevatedButton(
                  label: 'From Gallery',
                  icon: Icons.photo_library,
                  onPressed: () => controller.pickImage(ImageSource.gallery),
                ),
              ),
              const Divider(height: 40, color: Colors.grey),

              // **Video Display Section**
              _buildSectionTitle('Selected Video'),
              Obx(() {
                if (controller.selectedVideoPath.value.isEmpty) {
                  return _buildPlaceholder('No video selected');
                } else {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: VideoPlayer(controller.videoPlayerController!),
                        ),
                        VideoProgressIndicator(
                          controller.videoPlayerController!,
                          allowScrubbing: true,
                          padding: const EdgeInsets.all(8.0),
                          colors: VideoProgressColors(
                            backgroundColor: Colors.grey.shade300,
                            playedColor: Colors.teal,
                            bufferedColor: Colors.teal.shade200,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                controller.isVideoPlaying.value
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                              color: Colors.teal,
                              onPressed: controller.togglePlayPause,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              }),
              const SizedBox(height: 16),
              _buildButtonRow(
                firstButton: _buildElevatedButton(
                  label: 'From Camera',
                  icon: Icons.videocam,
                  onPressed: () => controller.pickVideo(ImageSource.camera),
                ),
                secondButton: _buildElevatedButton(
                  label: 'From Gallery',
                  icon: Icons.video_library,
                  onPressed: () => controller.pickVideo(ImageSource.gallery),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // **Helper Widgets**
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildPlaceholder(String text) {
    return Container(
      height: 200,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildElevatedButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildButtonRow({
    required Widget firstButton,
    required Widget secondButton,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [firstButton, secondButton],
    );
  }
}
