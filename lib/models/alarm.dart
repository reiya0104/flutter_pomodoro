import 'package:audioplayers/audioplayers.dart';

class Alarm {
  final AudioPlayer audioPlayer = AudioPlayer();

  Future<void> call() async {
    // タイマーの表示が 0 になったと同時にアラームがなるようにする
    // 5秒間だけアラーム音を再生
    await audioPlayer.resume();

    // 5秒後にアラーム音を停止
    Future.delayed(const Duration(seconds: 5), () {
      audioPlayer.stop();
    });
  }

  void init() {
    // AudioPlayerの初期設定
    Future(() async {
      await audioPlayer.setSourceAsset("sounds/alarm_se.mp3");
    });
  }
}
