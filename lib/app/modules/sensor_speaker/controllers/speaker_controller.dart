import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class SpeakerController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Variabel reaktif
  var isPlaying = false.obs;
  var duration = Duration.zero.obs;
  var position = Duration.zero.obs;
  var currentAudioUrl = ''.obs; // Menyimpan URL audio saat ini

  @override
  void onInit() {
    super.onInit();

    _audioPlayer.onDurationChanged.listen((d) {
      duration.value = d;
    });

    _audioPlayer.onPositionChanged.listen((p) {
      position.value = p;
    });
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }

  Future<void> playAudio(String url) async {
    currentAudioUrl.value = url; // Simpan URL audio yang sedang dimainkan
    await _audioPlayer.play(UrlSource(url));
    isPlaying.value = true;
  }

  Future<void> pauseAudio() async {
    await _audioPlayer.pause();
    isPlaying.value = false;
  }

  Future<void> resumeAudio() async {
    await _audioPlayer.resume();
    isPlaying.value = true;
  }

  Future<void> stopAudio() async {
    await _audioPlayer.stop();
    isPlaying.value = false;
    position.value = Duration.zero;
  }

  void seekAudio(Duration newPosition) {
    _audioPlayer.seek(newPosition);
  }
}
