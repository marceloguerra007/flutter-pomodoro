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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TimeInput(title: 'Trabalho', value: 25, titleColor: Colors.red.shade800),
              TimeInput(title: 'Descanso', value: 5, titleColor: Colors.green.shade800)
            ],
          ),
        ]
      )
    );
  }
}