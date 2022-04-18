import 'package:flutter/material.dart';

import '../utility/constants.dart';
import '../utility/engAlphabetList.dart';
import 'EnglishAlphabetItem.dart';

class EngAlphabetListScreen extends StatelessWidget {
  const EngAlphabetListScreen({Key? key}) : super(key: key);

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
        padding: EdgeInsets.all(10),
        child: GridView.builder(
            itemCount: EngAlphabetBig.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GridItem(index: index);
            }),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  int index;
  GridItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  EnglishAlphabetItemScreen(itemNumber: index),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            "${EngAlphabetBig[index]}",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
