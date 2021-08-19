import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MaterialApp(
      home: XylophoneApp(),
    ));

final player = AudioCache();

class XylophoneApp extends StatelessWidget {
  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 1; i <= 7; i++) {
      list.add(TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.green[100 * i]),
        onPressed: () {
          player.play('note$i.wav');
        },
        child: Text(
          'Touch me - note' + i.toString(),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Xylophone';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.greenAccent,
      ),
      body: GridView.count(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 0),
          crossAxisCount: 1,
          childAspectRatio: 7 / 1.9,
          children: _generateGridItems()),
    );
  }
}
