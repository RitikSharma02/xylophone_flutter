import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Future<void> playSound(int SoundNumber) async {
    final player = AudioPlayer();
    await player.setSource(AssetSource('note$SoundNumber.wav'));
    await player.resume();
  }

  Expanded buildKey({required Color color, required int soundnumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () async {
          playSound(soundnumber);
        },
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(color: Colors.red, soundnumber: 1),
            buildKey(color: Colors.orange, soundnumber: 2),
            buildKey(color: Colors.yellow, soundnumber: 3),
            buildKey(color: Colors.green, soundnumber: 4),
            buildKey(color: Colors.teal, soundnumber: 5),
            buildKey(color: Colors.blue, soundnumber: 6),
            buildKey(color: Colors.purple, soundnumber: 7),
          ],
        ),
      ),
    );
  }
}
