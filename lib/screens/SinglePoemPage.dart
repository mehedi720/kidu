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
  IconData playIcon = Icons.play_arrow;
  bool pause = false;
  bool isPlaying = false;
  AudioPlayer? adPlayer;
  AudioCache? localPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    adPlayer = AudioPlayer();
    localPlayer = AudioCache(
      fixedPlayer: adPlayer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ORANGE_PR,
        titleSpacing: 0,
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
                Positioned(
                  bottom: 10,
                  right: 20,
                  child: Container(
                    width: 80,
                    height: 80,
                    //alignment: Alignment(45, -16),
                    child: GestureDetector(
                      onTap: () {
                        if (!isPlaying) {
                          setState(() async {
                            await localPlayer?.play(
                                "mp3/poems/eng_poem_${widget.poemId}.mp3");
                            pause = false;
                            isPlaying = true;
                            playIcon = Icons.pause;
                          });
                        } else {
                          setState(() {
                            adPlayer?.pause();
                            pause = true;
                            isPlaying = false;
                            playIcon = Icons.play_arrow;
                          });
                        }
                      },
                      child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: ORANGE_PR),
                          child: Icon(
                            playIcon,
                            color: Colors.white,
                            size: 50,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 400,
              //alignment: Alignment(0, -8),
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
          ],
        ),
      ),
    );
  }
}
