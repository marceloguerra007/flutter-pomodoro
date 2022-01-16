import 'package:flutter/material.dart';

class TimeInput extends StatelessWidget {
  final int value;
  final String title;
  final Color titleColor;
  
  const TimeInput({ 
    required this.title,
    required this.titleColor,
    required this.value
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
              onPressed: (){}
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
              onPressed: (){}
            ),
          ],
        )
      ],
    );
  }
}