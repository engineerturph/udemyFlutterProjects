import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const secondaryCardColour = Color(0xFFEB1555);

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: WidgetCont(
                    colour: activeCardColour,
                  ),
                ),
                Expanded(
                  child: WidgetCont(
                    colour: activeCardColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: WidgetCont(
              colour: activeCardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: WidgetCont(
                    colour: activeCardColour,
                  ),
                ),
                Expanded(
                  child: WidgetCont(
                    colour: activeCardColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: secondaryCardColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

class WidgetCont extends StatelessWidget {
  WidgetCont({required this.colour});
  Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
