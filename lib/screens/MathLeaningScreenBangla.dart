import 'dart:math';

import 'package:flutter/material.dart';

import '../utility/constants.dart';

Map mathList = {
  0: ["১", "+", "২", "=", "৩"],
  1: ["৫", "+", "৩", "=", "৮"],
  2: ["৩", "+", "৪", "=", "৭"],
  3: ["৭", "-", "২", "=", "৫"],
  4: ["১০", "+", "৫", "=", "১৫"],
  5: ["৫", "*", "৬", "=", "৩০"],
  6: ["১৬", "/", "২", "=", "৮"],
  7: ["১৭", "-", "৪", "=", "১৩"],
  8: ["৪", "*", "৩", "=", "১২"],
  9: ["২০", "/", "৫", "=", "৪"],
  10: ["১৮", "-", "৭", "=", "১১"]
};

List mainColors = [
  ORANGE_PR,
  PURPLE_PR,
  GREEN_PR,
  YELLOW_PR,
  Colors.red,
  Colors.blueGrey,
  Colors.deepPurple
];

class automatedNumer {
  static int currentNumber = 0;
  static getNumber() {
    int newNumber = Random().nextInt(6);
    if (newNumber == currentNumber) {
      if (newNumber >= 6) {
        return newNumber--;
      } else
        return newNumber++;
    } else {
      currentNumber = newNumber;
      return currentNumber;
    }
  }
}

class MathLearningScreenBangla extends StatefulWidget {
  const MathLearningScreenBangla({Key? key}) : super(key: key);

  @override
  State<MathLearningScreenBangla> createState() =>
      _MathLearningScreenBanglaState();
}

class _MathLearningScreenBanglaState extends State<MathLearningScreenBangla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: ORANGE_PR,
        titleSpacing: 0,
        title: Text("Maths"),
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
        child: ListView.builder(
          itemCount: mathList.length,
          itemBuilder: (context, index) {
            return MathElementList(
              mathItem: mathList[index],
            );
          },
        ),
      ),
    );
  }
}

class MathElementList extends StatelessWidget {
  List mathItem;
  MathElementList({Key? key, required this.mathItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: mainColors[automatedNumer.getNumber()],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContentItem(content: mathItem[0]),
              ContentItem(content: mathItem[1]),
              ContentItem(content: mathItem[2]),
              ContentItem(content: mathItem[3]),
              ContentItem(content: mathItem[4]),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentItem extends StatelessWidget {
  String content;
  ContentItem({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "${content}",
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 40, color: Colors.white),
      ),
    );
  }
}
