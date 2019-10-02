import 'package:flutter/material.dart';
import 'animationPage.dart';
class VoicePage extends StatefulWidget {
  VoicePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _VoicePageState createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: Color.fromRGBO(128, 255, 38, 1),
      body: Column(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topCenter,
              child:
              Image.asset("images/page decouverte/titre ecran decouverte.png", height: height / 3,),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(width * 0.04, 0, 0, 10),
                  child: FlatButton(
                    child: Image.asset("images/page decouverte/Page voix/bouton train.png", width: width * 0.4, ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) { return AnimationPage("images/page decouverte/Page voix/Animations voix/train/", 3); })
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, width * 0.05 + 10, 10),
                  child: Image.asset("images/bouton non implemente.png", width: width * 0.4,),
                ),

              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(width * 0.05 + 10, 0, 0, 10),
                  child: Image.asset("images/bouton non implemente.png", width: width * 0.4,),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, width * 0.05 + 10, 10),
                  child: Image.asset("images/bouton non implemente.png", width: width * 0.4,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
