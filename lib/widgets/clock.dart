import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/models/timer_loop.dart';
import 'package:flutter_pomodoro/models/timer_mode.dart';
import 'package:flutter_pomodoro/widgets/dounut_chart/dount_timer.dart';
import 'package:flutter_pomodoro/widgets/timer_dial.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late TimerLoop _timerLoop;
  final AudioPlayer audioPlayer = AudioPlayer();

  // タイマーのコールバック内での処理
  Future<void> _handleTimerTick() async {
    if (_timerLoop.remainingSeconds == 1) {
      // タイマーの表示が 0 になったと同時にアラームがなるようにする
      // 5秒間だけアラーム音を再生
      await audioPlayer.resume();

      // 5秒後にアラーム音を停止
      Future.delayed(const Duration(seconds: 5), () {
        audioPlayer.stop();
      });
    }

    if (_timerLoop.remainingSeconds == 0) {
      // 残り時間が0になったらタイマーをリスタート
      _timerLoop.switchAndRestart();
    } else {
      setState(() {
        _timerLoop.decrementRemainingSeconds();
      });
    }
  }

  @override
  void initState() {
    super.initState();

    // AudioPlayerの初期設定
    Future(() async {
      await audioPlayer.setSourceAsset("sounds/alarm_se.mp3");
      setState(() {});
    });

    _timerLoop = TimerLoop(
        timerMode: TimerMode.work,
        onTick: () {
          _handleTimerTick();
        },
        onEnd: () {
          setState(() {});
        });
    _timerLoop.start();
  }

  @override
  Widget build(BuildContext context) {
    int remainingSeconds = _timerLoop.remainingSeconds;
    TimerMode timerMode = _timerLoop.timerMode;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        DountTimer(
          remainingSeconds: remainingSeconds,
          timerMode: timerMode,
        ),
        TimerDial(
          remainingSeconds: remainingSeconds,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timerLoop.dispose();
    super.dispose();
  }
}
