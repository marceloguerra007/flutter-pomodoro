import 'package:flutter/material.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class TimeInput extends StatelessWidget {
  final int value;
  final String title;
  final Color titleColor;
  final void Function()? inc;
  final void Function()? dec;
  
  const TimeInput({ 
    required this.title,
    required this.titleColor,
    required this.value,
    this.inc,
    this.dec
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          this.title,          
          style: TextStyle(
            fontSize: 25,
            color: titleColor
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15)
              ),              
              onPressed: this.dec
            ),
            Text(
              '${this.value} min.',
              style: TextStyle(
                fontSize: 18
              ),
            ),
            ElevatedButton(              
              child: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),                
              ),              
              onPressed: this.inc
            ),
          ],
        )
      ],
    );
  }
}