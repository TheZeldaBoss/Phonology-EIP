import 'package:flutter/material.dart';
import 'dart:async';
class AnimationPage extends StatefulWidget {

  List<String> photos;

  AnimationPage(String animation, int nbFrames)
  {
    photos = new List<String>();
    for (int i = 0; i < nbFrames; i++)
      {
        photos.add(animation + "frame " + i.toString() + ".png");
      }
  }

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {

  int _pos = 0;
  Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        print(_pos);
        _pos = (_pos + 1) % widget.photos.length;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new Image.asset(
            widget.photos[_pos],
            gaplessPlayback: true,
    );
  }

  @override
  void dispose()
  {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }
}
