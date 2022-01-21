import 'package:mobx/mobx.dart';
import 'dart:async';

import 'package:pomodoro/utils/sound.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum IntervalType {WORK, REST}

abstract class _PomodoroStore with Store {
  @observable
  int workTime = 25;

  @observable
  int restTime = 3;

  @observable
  int minutes = 25;

  @observable
  int seconds = 0;

  @observable
  bool started = false;

  @observable
  IntervalType intervalType = IntervalType.WORK;

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
    stop();

    minutes = isWorking() ? workTime : restTime;
    seconds = 0;
  }

  void incrementWorkTime(){
    workTime++;

    if (isWorking()){
      reset();
    }
  }

  @action
  void decrementWorkTime(){
    if (workTime > 1)
      workTime--;

    if (isWorking()){
      reset();
    }
  }

  @action
  void incrementRestTime(){
    restTime++;

    if (isResting()){
      reset();
    }
  }

  @action
  Future<void> decrementRestTime() async {
    if (restTime > 1)
      restTime--;
    
    if (isResting()){
      reset();
    }
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

    _playSound();
  }

  Future<void> _playSound() async {
    await Sound.play();    
  }
}
