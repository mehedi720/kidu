import 'dart:math';

import 'package:flutter/material.dart';

class NumberGameScreen extends StatefulWidget {
  const NumberGameScreen({Key? key}) : super(key: key);

  @override
  State<NumberGameScreen> createState() => _NumberGameScreenState();
}

class _NumberGameScreenState extends State<NumberGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 200,
            child: GridView.builder(
                itemCount: Random().nextInt(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext, index) {
                  return Container();
                }),
          )
        ],
      ),
    );
  }
}
