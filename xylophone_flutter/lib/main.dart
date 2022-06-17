import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int type) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$type.wav'));
  }

  Expanded buildKey({int soundNum: 1, Color color: Colors.blue}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        onPressed: () async {
          playSound(soundNum);
        },
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(soundNum: 1, color: Colors.blue),
              buildKey(soundNum: 2, color: Colors.red),
              buildKey(soundNum: 3, color: Colors.yellow),
              buildKey(soundNum: 4, color: Colors.grey),
              buildKey(soundNum: 5, color: Colors.green),
              buildKey(soundNum: 6, color: Colors.greenAccent),
              buildKey(soundNum: 7, color: Colors.teal),
            ],
          ),
        ),
      ),
    );
  }
}

//flutter run --no-sound-null-safety
