import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class XylophonePage extends StatefulWidget {
  const XylophonePage({super.key});

  @override
  State<XylophonePage> createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  bool isXylophone = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xylophone'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isXylophone = !isXylophone;
              });
            },
            icon: isXylophone
                ? const Icon(Icons.grid_4x4)
                : const Icon(Icons.list),
          )
        ],
      ),
      body: isXylophone ? createXyloPhoneWidget() : createFunnySoundsBoard(),
    );
  }

  Widget createFunnySoundsBoard() {
    return Center(
      child: Column(children: [
        Expanded(
            child: Row(
          children: [
            newColorButton(Colors.amber, Colors.amberAccent, 1),
            newColorButton(Colors.orange, Colors.orangeAccent, 2),
            newColorButton(Colors.red, Colors.redAccent, 3),
          ],
        ))
      ]),
    );
  }

  Widget createXyloPhoneWidget() {
    return Center(
      child: Column(
        children: [
          newColorButton(Colors.red, Colors.redAccent, 1),
          newColorButton(Colors.orange, Colors.orangeAccent, 2),
          newColorButton(Colors.yellow, Colors.yellowAccent, 3),
          newColorButton(Colors.green, Colors.greenAccent, 4),
          newColorButton(Colors.cyan, Colors.cyanAccent, 5),
          newColorButton(Colors.blue, Colors.blueAccent, 6),
          newColorButton(Colors.purple, Colors.purpleAccent, 7)
        ],
      ),
    );
  }

  Widget newColorButton(Color newColor, Color newSplashColor, int noteNumber) {
    return Expanded(
        child: Material(
      child: InkWell(
        splashColor: newSplashColor,
        onTap: () {
          var player = AudioPlayer();
          if (isXylophone) {
            player.play(AssetSource('notes/note$noteNumber.wav'));
          } else {
            player.play(UrlSource(
                'www.myinstants.com/pt/instant/risadinha-de-ladrao-8117/utm?_source=copy&utm_medium=share'));
          }
        },
        child: Ink(color: newColor),
      ),
    ));
  }
}
