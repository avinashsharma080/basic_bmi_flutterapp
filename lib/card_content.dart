import 'package:flutter/material.dart';
import 'constant.dart';

class CardContent extends StatelessWidget {
  final String text;
  final IconData icon;

  CardContent({@required this.text, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Color(0xFF8D8E98),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          text,
          style: ktextStyle,
        )
      ],
    );
  }
}
