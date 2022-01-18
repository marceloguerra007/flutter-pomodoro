import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/timerButton.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Timer extends StatelessWidget {
  const Timer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    
    return Observer(      
      builder: (_) {
        return Container(
          color: store.isWorking() ? Colors.red.shade800 : Colors.green.shade800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,        
            children: [
              Text(
                store.isWorking() ? 'Hora de Trabalhar' : 'Hora de Descansar',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white
                ),
              ),
              SizedBox(height: 20),
              Text(
                '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2,'0')}',
                style: TextStyle(
                  fontSize: 120,
                  color: Colors.white
                ),
              ),            
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(!store.started)
                    TimerButton(
                      text: 'Iniciar', 
                      icon: Icons.play_arrow,
                      click: store.start,
                    ),
                  if (store.started)
                    TimerButton(
                      text: 'Parar', 
                      icon: Icons.stop,
                      click: store.stop,
                    ),
                  TimerButton(
                    text: 'Reiniciar', 
                    icon: Icons.refresh,
                    click: store.reset,
                  ),
                ],
              )
            ],
          ),
        );
      }
    );
  }
}