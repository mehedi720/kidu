import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kidu/utility/PoemList.dart';

import '../utility/constants.dart';

AudioCache player = AudioCache();

class SinglePoemPage extends StatefulWidget {
  var poemId;

  SinglePoemPage({Key? key, this.poemId}) : super(key: key);

  @override
  State<SinglePoemPage> createState() => _SinglePoemPageState();
}

class _SinglePoemPageState extends State<SinglePoemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ORANGE_PR,
        titleSpacing: 0,
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
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                    tag: widget.poemId,
                    child: Image.asset(
                      "assets/poem/poem_${widget.poemId}.png",
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color.fromRGBO(0, 0, 0, 0.5)
                        ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Flex(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                          flex: 6,
                          child: Text(
                            "${PoemList[widget.poemId]}",
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                        ),
                        Flexible(flex: 2, child: Container())
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 400,
                    alignment: Alignment(0, -8),
                    child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 100.0),
                        itemCount: Lyrics().getLyricsLength(widget.poemId),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              "${LyricsList[widget.poemId][index]}",
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 22),
                            ),
                            minVerticalPadding: 20,
                            style: ListTileStyle.list,
                          );
                        }),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment(45, -16),
                    child: GestureDetector(
                      onTap: () {
                        player.play("mp3/poems/eng_poem_${widget.poemId}.mp3");
                        print("assets/mp3/poems/eng_poem${widget.poemId}.mp3");
                      },
                      child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: ORANGE_PR),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 40,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
