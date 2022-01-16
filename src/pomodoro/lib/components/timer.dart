import 'package:flutter/material.dart';
import 'package:pomodoro/components/timerButton.dart';

class Timer extends StatelessWidget {
  const Timer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade800,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,        
        children: [
          Text(
            'Hora de Trabalhar',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white
            ),
          ),
          SizedBox(height: 20),
          Text(
            '25:00',
            style: TextStyle(
              fontSize: 120,
              color: Colors.white
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimerButton(
                text: 'Iniciar', 
                icon: Icons.play_arrow
              ),
              TimerButton(
                text: 'Parar', 
                icon: Icons.stop
              ),
              TimerButton(
                text: 'Reiniciar', 
                icon: Icons.refresh
              ),
            ],
          )
        ],
      ),
    );
  }
}