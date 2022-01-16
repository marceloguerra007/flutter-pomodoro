import 'package:flutter/material.dart';
import 'package:pomodoro/components/TimeInput.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Pomodoro'),
          TimeInput(title: 'Trabalho', value: 25),
          TimeInput(title: 'Descanso', value: 5)
        ]
      )
    );
  }
}