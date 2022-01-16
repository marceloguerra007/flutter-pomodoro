import 'package:flutter/material.dart';
import 'package:pomodoro/components/TimeInput.dart';
import 'package:pomodoro/components/timer.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Timer()
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TimeInput(title: 'Trabalho', value: 25, titleColor: Colors.red.shade800),
                TimeInput(title: 'Descanso', value: 5, titleColor: Colors.green.shade800)
              ],
            ),
          ),
        ]
      )
    );
  }
}