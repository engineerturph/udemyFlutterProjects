import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:bmi_flutter/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kResultTextStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: kActiveCardColour,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'OVERWEIGHT',
                        style: kResultTopTextStyle,
                      ),
                      Text(
                        '26.7',
                        style: kResultNumberStyle,
                      ),
                      Text(
                        'You have a higher than normal body weight. Try to exercise more',
                        style: kResultDownTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ]),
              ),
            ),
            BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              innerText: 'RE-CALCULATE',
            )
          ]),
    );
  }
}
