import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/TimeInput.dart';
import 'package:pomodoro/components/timer.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Timer()
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimeInput(
                    title: 'Trabalho', 
                    value: store.workTime, 
                    titleColor: Colors.red.shade800,
                    inc: store.incrementWorkTime,
                    dec: store.decrementWorkTime,
                  ),
                  TimeInput(
                    title: 'Descanso', 
                    value: store.restTime, 
                    titleColor: Colors.green.shade800,
                    inc: store.incrementRestTime,
                    dec: store.decrementRestTime,
                  )
                ],
              ),
            )
          ),
        ]
      )
    );
  }
}