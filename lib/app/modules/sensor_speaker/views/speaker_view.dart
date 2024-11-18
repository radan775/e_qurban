import 'package:e_qurban/app/modules/sensor_speaker/controllers/speaker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpeakerView extends GetView<SpeakerController> {
  const SpeakerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller untuk input URL audio
    final TextEditingController urlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Input URL Audio
            TextField(
              controller: urlController,
              decoration: InputDecoration(
                labelText: 'Enter Audio URL',
                hintText: 'https://example.com/audio.mp3',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.link),
              ),
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 20),

            // Tombol untuk mengubah URL audio
            ElevatedButton(
              onPressed: () {
                final newUrl = urlController.text.trim();
                if (newUrl.isNotEmpty) {
                  controller.playAudio(newUrl); // Ganti audio dengan URL baru
                  Get.snackbar(
                    'Audio URL Changed',
                    'Now playing: $newUrl',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.greenAccent,
                    colorText: Colors.white,
                  );
                } else {
                  Get.snackbar(
                    'Invalid URL',
                    'Please enter a valid audio URL.',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                  );
                }
              },
              child: const Text('Change Audio'),
            ),
            const SizedBox(height: 30),

            // Slider untuk mengontrol posisi audio
            Obx(() {
              return Column(
                children: [
                  Slider(
                    min: 0.0,
                    max: controller.duration.value.inSeconds.toDouble(),
                    value: controller.position.value.inSeconds.toDouble(),
                    onChanged: (value) {
                      controller.seekAudio(Duration(seconds: value.toInt()));
                    },
                    activeColor: Colors.blueAccent,
                    inactiveColor: Colors.grey[300],
                  ),
                  // Menampilkan waktu yang sudah diputar dan durasi total
                  Text(
                    '${_formatDuration(controller.position.value)} / ${_formatDuration(controller.duration.value)}',
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              );
            }),

            const SizedBox(height: 40),

            // Tombol kontrol audio
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tombol Play
                  IconButton(
                    onPressed: () =>
                        controller.playAudio(controller.currentAudioUrl.value),
                    icon: const Icon(Icons.play_arrow),
                    color: Colors.blueAccent,
                    iconSize: 36,
                  ),
                  const SizedBox(width: 20),

                  // Tombol Pause/Resume
                  IconButton(
                    onPressed: controller.isPlaying.value
                        ? controller.pauseAudio
                        : controller.resumeAudio,
                    icon: Icon(
                      controller.isPlaying.value
                          ? Icons.pause
                          : Icons.play_circle_fill,
                    ),
                    color: Colors.orange,
                    iconSize: 36,
                  ),
                  const SizedBox(width: 20),

                  // Tombol Stop
                  IconButton(
                    onPressed: controller.stopAudio,
                    icon: const Icon(Icons.stop),
                    color: Colors.redAccent,
                    iconSize: 36,
                  ),
                ],
              );
            }),

            const SizedBox(height: 30),

            // Teks Deskripsi Audio
            const Text(
              "Use the controls above to play, pause, or stop the audio.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk memformat durasi menjadi menit:detik
  String _formatDuration(Duration duration) {
    return "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }
}
