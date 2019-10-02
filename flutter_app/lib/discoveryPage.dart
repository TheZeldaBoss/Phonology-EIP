import 'package:flutter/material.dart';
import 'DiscoveryExercises/voicePage.dart';

class DiscoveryPage extends StatefulWidget {
  DiscoveryPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {

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
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child:
                    FlatButton(
                      child: Image.asset("images/page decouverte/Voix.png", width: width * 0.3, ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) { return VoicePage(); })
                        );
                      },
                    )

                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 15, 10),
                  child: Image.asset("images/page decouverte/Intensite.png", width: width * 0.3,),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                  child: Image.asset("images/page decouverte/Frequence.png", width: width * 0.3,),
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
                    padding: EdgeInsets.fromLTRB(width * 0.15 + 10, 0, 0, 10),
                    child:
                    FlatButton(
                      child: Image.asset("images/page decouverte/Voisement.png", width: width * 0.3, ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) { return DiscoveryPage(); })
                        );
                      },
                    )

                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, width * 0.15 + 10, 10),
                  child: Image.asset("images/page decouverte/Attaque voisement.png", width: width * 0.3,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
