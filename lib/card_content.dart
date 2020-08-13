import 'package:flutter/material.dart';
import 'constant.dart';

class CardContent extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;

  CardContent({
    @required this.text,
    @required this.icon,
    @required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(flex: 2),
        Icon(
          icon,
          size: 80.0,
          color: isSelected ? Colors.amberAccent : Color(0xFF8D8E98),
        ),
        Spacer(flex: 1),
        Text(
          text,
          style: ktextStyle,
        ),
        Spacer(flex: 2),
      ],
    );
  }
}
