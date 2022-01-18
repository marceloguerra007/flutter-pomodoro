import 'package:mobx/mobx.dart';
import 'dart:async';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum IntervalType {WORK, REST}

abstract class _PomodoroStore with Store {
  @observable
  int workTime = 2;

  @observable
  int restTime = 1;

  @observable
  int minutes = 2;

  @observable
  int seconds = 0;

  @observable
  bool started = false;

  @observable
  IntervalType intervalType = IntervalType.REST;

  Timer? timer;

  @action
  void start(){
    started = true;
    timer = Timer.periodic(
      Duration(seconds: 1), (timer) { 
        if (minutes == 0 && seconds == 0){
          _changeIntervalType();
        } else if (seconds == 0){
          seconds = 59;
          minutes--;
        }else {
          seconds--;
        }
      });
  }

  @action
  void stop(){
    started = false;
    timer?.cancel();
  }

  @action
  void reset(){
    started = false;
  }

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

  bool isWorking(){
    return intervalType == IntervalType.WORK;
  }

  bool isResting(){
    return intervalType == IntervalType.REST;
  }

  void _changeIntervalType(){
    if (isWorking()){
      intervalType = IntervalType.REST;
      minutes = restTime;
    } else {
      intervalType = IntervalType.WORK;
      minutes = workTime;
    }
    seconds = 0;
  }
}
