import 'package:flutter/material.dart';
import 'package:kidu/screens/SingleBnPoemPage.dart';

import '../utility/PoemList.dart';
import '../utility/constants.dart';

class BanglaPoemSelectionPage extends StatefulWidget {
  const BanglaPoemSelectionPage({Key? key}) : super(key: key);

  @override
  State<BanglaPoemSelectionPage> createState() =>
      _BanglaPoemSelectionPageState();
}

class _BanglaPoemSelectionPageState extends State<BanglaPoemSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: ORANGE_PR,
        titleSpacing: 0,
        title: Text("Poems"),
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
        child: GridView.builder(
          itemCount: BanglaPoemList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: .6),
          itemBuilder: (BuildContext, index) {
            return PoemItem(index: index);
          },
        ),
      ),
    );
  }
}

class PoemItem extends StatelessWidget {
  int index;
  PoemItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleBnPoemPage(
                      poemId: index,
                    )));
      },
      child: Container(
        child: Stack(
          children: [
            Hero(
              tag: index,
              child: Image.asset(
                "assets/poem/bn_poem_${index}.png",
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.transparent,
                    Color.fromRGBO(0, 0, 0, 0.8)
                  ])),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${BanglaPoemList[index]}",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
