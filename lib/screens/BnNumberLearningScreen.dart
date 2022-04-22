import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../utility/constants.dart';

List AllNumbersBn = [
  "এক",
  "দুই",
  "তিন",
  "চার",
  "পাঁচ",
  "ছয়",
  "সাত",
  "আট",
  "নয়",
  "দশ",
  "এগারো",
  "বারো"
];
List BnNumbers = [
  "১",
  "২",
  "৩",
  "৪",
  "৫",
  "৬",
  "৭",
  "৮",
  "৯",
  "১০",
  "১১",
  "১২"
];
AudioCache audio = AudioCache();

class BnNumberLearningScreen extends StatefulWidget {
  const BnNumberLearningScreen({Key? key}) : super(key: key);

  @override
  State<BnNumberLearningScreen> createState() => _BnNumberLearningScreenState();
}

class _BnNumberLearningScreenState extends State<BnNumberLearningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: ORANGE_PR,
        titleSpacing: 0,
        title: Text("সংখ্যা"),
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
              primary: true,
              itemCount: 12,
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text(
                "${BnNumbers[widget.index]}",
                style: TextStyle(
                  fontSize: 40,
                  color: widget.foregroundColor ?? PURPLE_PR,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "${AllNumbersBn[widget.index]}",
                style: TextStyle(
                  fontSize: 40,
                  color: widget.foregroundColor ?? PURPLE_PR,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
