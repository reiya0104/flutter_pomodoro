enum TimerMode {
  work,
  shortBreak,
}

const Map<TimerMode, int> initialSeconds = {
  TimerMode.work: 25 * 60,
  TimerMode.shortBreak: 5 * 60,
};
