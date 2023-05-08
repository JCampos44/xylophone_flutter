import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  List<Widget> buildKeys() {
    List<MaterialColor> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.purple
    ];

    List<Widget> keys = [];

    for (int i = 0; i < 7; i++) {
      keys.add(
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: colors[i]),
            onPressed: () {
              playSound(i + 1);
            },
            child: Text(''),
          ),
        ),
      );
    }

    return keys;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildKeys(),
          ),
        ),
      ),
    );
  }
}
