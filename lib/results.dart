import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';

class Resultpage extends StatelessWidget {
  Resultpage(
      {@required this.bmi,
      @required this.interpreatation,
      @required this.result});

  final String bmi;
  final String result;
  final String interpreatation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Your result",
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  color: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        result.toUpperCase(),
                        style: kresultstyle,
                      ),
                      Text(
                        bmi,
                        style: kBMItextstyle,
                      ),
                      Text(
                        interpreatation,
                        style: kresulttextstyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
            BottomButton(
              buttontext: "Return to first page",
              tap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
