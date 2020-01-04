import 'package:flutter/material.dart';

class ReusableExpandedDays extends StatelessWidget {
  final String textDay;
  final String textDegrees;

  ReusableExpandedDays({this.textDay, this.textDegrees});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: <Widget>[
        Text(
          textDay,
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xFF525969),
          ),
        ),
        Text(
          '$textDegrees°',
          style: TextStyle(color: Colors.white70, fontSize: 20.0),
        )
      ],
    ));
  }
}
