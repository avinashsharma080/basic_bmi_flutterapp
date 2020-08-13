import 'package:flutter/material.dart';
import 'constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttontext, @required this.tap});

  final Function tap;
  final String buttontext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        child: Center(
          child: Text(
            buttontext,
            style: klargestyle,
          ),
        ),
        //padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
        color: Color(0xFF142952),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}
