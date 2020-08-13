import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_content.dart';
import 'reusable_card.dart';
import 'constant.dart';
import 'results.dart';
import 'bottom_button.dart';
import 'rounded_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.amberAccent),
        ),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kinactiveCardColor;
  Color femaleCardColor = kinactiveCardColor;
  int startHeight = 180;
  int startWeight = 20;
  int startAge = 10;

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    int boxFlex = 10;
    int bottomBarFlex = 6;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: boxFlex,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onpress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kinactiveCardColor
                          : kactiveCardColor,
                      cardChild: CardContent(
                        text: "Male",
                        icon: FontAwesomeIcons.mars,
                        isSelected: selectedGender == Gender.male,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                    child: ReusableCard(
                      onpress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kinactiveCardColor
                          : kactiveCardColor,
                      cardChild: CardContent(
                        text: "Female",
                        icon: FontAwesomeIcons.venus,
                        isSelected: selectedGender == Gender.female,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: boxFlex,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    color: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "slider",
                          style: ktextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Text(
                              startHeight.toString(),
                              style: ksliderstyle,
                            ),
                            Text(
                              'cm',
                              style: ktextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 13.0),
                          ),
                          child: Slider(
                            value: startHeight.toDouble(),
                            onChanged: (double newHeight) {
                              setState(() {
                                startHeight = newHeight.round();
                              });
                            },
                            min: 100.0,
                            max: 300.0,
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: boxFlex,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: ktextStyle,
                          ),
                          Text(
                            startWeight.toString(),
                            style: ksliderstyle,
                          ),
                          Row(
                            children: [
                              Spacer(flex: 3),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                color: Colors.green,
                                presssed: () {
                                  setState(() {
                                    startWeight += 1;
                                  });
                                },
                              ),
                              Spacer(flex: 2),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                color: Colors.red,
                                presssed: () {
                                  setState(() {
                                    if (startWeight >= 20) {
                                      startWeight -= 1;
                                    }
                                  });
                                },
                              ),
                              Spacer(flex: 3),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                      child: ReusableCard(
                    color: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: ktextStyle,
                        ),
                        Text(
                          startAge.toString(),
                          style: ksliderstyle,
                        ),
                        Row(
                          children: [
                            Spacer(flex: 3),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              color: Colors.green,
                              presssed: () {
                                setState(() {
                                  startAge += 1;
                                });
                              },
                            ),
                            Spacer(flex: 2),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              color: Colors.red,
                              presssed: () {
                                setState(() {
                                  if (startAge >= 8) {
                                    startAge -= 1;
                                  }
                                });
                              },
                            ),
                            Spacer(flex: 3),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: bottomBarFlex,
            child: BottomButton(
              buttontext: "Calculate",
              tap: () {
                BmiCalculator calc =
                    BmiCalculator(height: startHeight, weight: startWeight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Resultpage(
                              bmi: calc.getBmi(),
                              result: calc.getresult(),
                              interpreatation: calc.interpretation(),
                            )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
