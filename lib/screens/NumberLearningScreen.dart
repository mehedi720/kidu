import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidu/utility/constants.dart';

AudioCache audio = AudioCache();

class NumberLearningScreen extends StatefulWidget {
  const NumberLearningScreen({Key? key}) : super(key: key);

  @override
  State<NumberLearningScreen> createState() => _NumberLearningScreenState();
}

class _NumberLearningScreenState extends State<NumberLearningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: ORANGE_PR,
        titleSpacing: 0,
        title: Text("Numbers"),
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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Tap to listen ",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: GREEN_PR,
            ),
          ),
          SizedBox(
            height: 20,
            width: double.infinity,
          ),
          Container(
            height: 600,
            child: GridView.builder(
              itemCount: 12,
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 100),
              itemBuilder: (BuildContext, index) {
                return NumberGridItem(
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NumberGridItem extends StatefulWidget {
  int index;
  Color? backgroundColor, foregroundColor;
  NumberGridItem({Key? key, required this.index}) : super(key: key);

  @override
  State<NumberGridItem> createState() => _NumberGridItemState();
}

class _NumberGridItemState extends State<NumberGridItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        play() async {
          await audio.play("mp3/${widget.index + 1}.mp3");
        }

        ;
        setState(() {
          widget.backgroundColor = ORANGE_2;
          widget.foregroundColor = ORANGE_PR;
          play();
        });
      },
      child: Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? PURPLE_2,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          "${widget.index + 1}",
          style: TextStyle(
            fontSize: 50,
            color: widget.foregroundColor ?? PURPLE_PR,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
