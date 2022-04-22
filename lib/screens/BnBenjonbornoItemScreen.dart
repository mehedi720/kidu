import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:kidu/utility/banglaBornomal.dart';
import 'package:kidu/utility/constants.dart';

class BnBenjonbornoItemScreen extends StatefulWidget {
  int itemNumber;
  BnBenjonbornoItemScreen({Key? key, required this.itemNumber})
      : super(key: key);

  @override
  State<BnBenjonbornoItemScreen> createState() =>
      _BnBenjonbornoItemScreenState();
}

class _BnBenjonbornoItemScreenState extends State<BnBenjonbornoItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: ORANGE_PR,
        titleSpacing: 0,
        title: Text("${BanglaAlphabetConsonants[widget.itemNumber]}"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "Contact");
                  },
                  child: ListTile(
                    title: Text("Contact"),
                  ),
                ),
              ),
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "About");
                  },
                  child: ListTile(
                    title: Text("About"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/bg2.png"),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              children: [
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${BanglaAlphabetConsonants[widget.itemNumber]}",
                        style: TextStyle(
                            fontSize: 160,
                            fontWeight: FontWeight.w900,
                            fontFamily: "mahfuz"),
                      ),
                      // Text(
                      //   "${EngAlphabetSm[widget.itemNumber]}",
                      //   style:
                      //   TextStyle(fontSize: 180, fontWeight: FontWeight.w900),
                      // ),
                      Container(
                        height: 250,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: PURPLE_PR),
                                child: GestureDetector(
                                  onTap: () {
                                    AudioCache pl = AudioCache();
                                    pl.play(
                                        "mp3/benjon/${widget.itemNumber}.mp3");
                                  },
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Text(
                        "${BanglaAlphabetConsonantsWords[widget.itemNumber]}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                            fontFamily: "borshon"),
                      ),
                    ),
                    Flexible(
                        flex: 12,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Image.asset(
                            "assets/alphabet/bn/benjonborno/${widget.itemNumber}.png",
                            fit: BoxFit.cover,
                          ),
                        ))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
