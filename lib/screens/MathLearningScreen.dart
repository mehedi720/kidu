import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kidu/utility/constants.dart';

Map mathList = {
  0: ["1", "+", "2", "=", "3"],
  1: ["5", "+", "3", "=", "10"],
  2: ["3", "+", "4", "=", "7"],
  3: ["7", "-", "2", "=", "5"],
  4: ["10", "+", "5", "=", "15"],
  5: ["5", "*", "6", "=", "30"],
  6: ["16", "/", "2", "=", "8"],
  7: ["17", "-", "4", "=", "13"],
  8: ["4", "*", "3", "=", "12"],
  9: ["20", "/", "5", "=", "4"],
  10: ["18", "-", "7", "=", "11"]
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

class MathLearningScreen extends StatefulWidget {
  MathLearningScreen({Key? key}) : super(key: key);

  @override
  State<MathLearningScreen> createState() => _MathLearningScreenState();
}

class _MathLearningScreenState extends State<MathLearningScreen> {
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
