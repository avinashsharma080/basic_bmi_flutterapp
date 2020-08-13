import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function presssed;

  RoundIconButton({@required this.icon, this.color, @required this.presssed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: color,
      ),
      onPressed: presssed,
      elevation: 5.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      padding: EdgeInsets.all(20.0),
      constraints: BoxConstraints(minHeight: 56.0, minWidth: 56.0),
    );
  }
}
