import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kidu/utility/banglaBornomal.dart';

import '../utility/constants.dart';

class BnSorobornoItemScreen extends StatefulWidget {
  int itemNumber;
  BnSorobornoItemScreen({Key? key, required this.itemNumber}) : super(key: key);

  @override
  State<BnSorobornoItemScreen> createState() => _BnSorobornoItemScreenState();
}

class _BnSorobornoItemScreenState extends State<BnSorobornoItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: ORANGE_PR,
        titleSpacing: 0,
        title: Text("${BanglaAlphabetVowels[widget.itemNumber]}"),
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
      body: Padding(
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
                      "${BanglaAlphabetVowels[widget.itemNumber]}",
                      style:
                          TextStyle(fontSize: 180, fontWeight: FontWeight.w900),
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
                                      "mp3/soroborno/${widget.itemNumber}.mp3");
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
                      "${BanglaAlphabetVowelsWords[widget.itemNumber]}",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Flexible(
                      flex: 12,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Image.asset(
                          "assets/alphabet/bn/soroborno/${widget.itemNumber}.png",
                          fit: BoxFit.cover,
                        ),
                      ))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
