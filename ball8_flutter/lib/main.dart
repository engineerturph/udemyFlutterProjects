import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Ball(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Ask Me Anything'),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  State<Ball> createState() => _State();
}

class _State extends State<Ball> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Expanded(
          child: Image(
            image: AssetImage('images/ball1.png'),
          ),
        ),
      ],
    );
  }
}
