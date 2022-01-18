import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? click;
  
  const TimerButton({ 
    required this.text,
    required this.icon,
    this.click
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue.shade600,
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20
          )
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                icon,
                size: 30
              ),
            ),
            Text(text)
          ]        
        ),
        onPressed:this.click, 
      ),
    );
  }
}