import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

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
                  child: WidgetCont(Color(0xFF1D1E33)),
                ),
                Expanded(child: WidgetCont(Color(0xFF1D1E33))),
              ],
            ),
          ),
          Expanded(child: WidgetCont(Color(0xFF1D1E33))),
          Expanded(
            child: Row(
              children: [
                Expanded(child: WidgetCont(Color(0xFF1D1E33))),
                Expanded(child: WidgetCont(Color(0xFF1D1E33))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetCont extends StatelessWidget {
  WidgetCont(@required this.colour);
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
