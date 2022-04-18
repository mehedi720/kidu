import 'package:flutter/material.dart';
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.more_vert,
              size: 32,
            ),
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
                      "${BanglaAlphabetConsonants[widget.itemNumber]}",
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
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 40,
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
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
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
    );
  }
}
