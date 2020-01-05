import 'package:flutter/material.dart';

class ReusableExpandedDays extends StatelessWidget {
  final String textDay;
  final String textMinDegrees;
  final String textMaxDegrees;

  ReusableExpandedDays(
      {this.textDay, this.textMinDegrees, this.textMaxDegrees});
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
          Row(
            children: <Widget>[
              Text(
                'Min-',
                style: TextStyle(
                  color: Color(0xff555969),
                  fontSize: 10.0,
                ),
              ),
              Text(
                '$textMinDegrees°',
                style: TextStyle(color: Colors.white70, fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                'Max-',
                style: TextStyle(
                  color: Color(0xff555969),
                  fontSize: 10.0,
                ),
              ),
              Text(
                '$textMaxDegrees°',
                style: TextStyle(color: Colors.white70, fontSize: 15.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
