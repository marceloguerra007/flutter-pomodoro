import 'package:flutter/material.dart';

class TimeInput extends StatelessWidget {
  final int value;
  final String title;
  
  const TimeInput({ 
    required this.title,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(this.title),
        Text('${this.value}')
      ],
    );
  }
}