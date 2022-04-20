import 'package:flutter/material.dart';
import 'package:kidu/utility/engAlphabetList.dart';

import '../utility/constants.dart';

List myColors = [ORANGE_PR, GREEN_PR, PURPLE_PR, YELLOW_PR];
Map WordLetters = {
  0: ["A", "B", "P", "P", "C", "L", "G", "E"],
};

class WordGameScreen extends StatefulWidget {
  const WordGameScreen({Key? key}) : super(key: key);

  @override
  State<WordGameScreen> createState() => _WordGameScreenState();
}

class _WordGameScreenState extends State<WordGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: ORANGE_PR,
        titleSpacing: 0,
        title: Text("Alphabets"),
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Guess the word you see in this picture",
                  ),
                )),
            Flexible(
              flex: 3,
              child: Container(
                child: Column(
                  children: [
                    Container(
                        height: 220,
                        child: Image.asset("assets/alphabet/eng/${0}.png")),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      child: GridView.builder(
                        itemCount: EngWordGameHelper.getWordItem(0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: EngWordGameHelper.getWordItem(0),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return WordFillupItem();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
                flex: 2,
                child: Container(
                  child: GridView.builder(
                      itemCount: 8,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return LetterOptions(
                          index: index,
                          wordList: WordLetters[0],
                        );
                      }),
                ))
          ],
        ),
      ),
    );
  }
}

class LetterOptions extends StatelessWidget {
  int index;
  List wordList;
  LetterOptions({Key? key, required this.index, required this.wordList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("${wordList[index]}"),
    );
  }
}

class WordFillupItem extends StatelessWidget {
  const WordFillupItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
            bottom: BorderSide(
                width: 1, color: ORANGE_PR, style: BorderStyle.solid)),
      ),
      child: Center(
        child: Text("lol"),
      ),
    );
  }
}
