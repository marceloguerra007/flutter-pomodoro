import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
  @observable
  int workTime = 2;

  @observable
  int restTime = 1;

  void incrementWorkTime(){
    workTime++;
  }

  @action
  void decrementWorkTime(){
    workTime--;
  }

  @action
  void incrementRestTime(){
    restTime++;
  }

  @action
  void decrementRestTime(){
    restTime--;
  }
}
