import 'package:flutter/material.dart';
import 'package:kidu/screens/BnSorobornoItemScreen.dart';
import 'package:kidu/utility/banglaBornomal.dart';

import '../utility/constants.dart';

class BnSorobornoListScreen extends StatefulWidget {
  const BnSorobornoListScreen({Key? key}) : super(key: key);

  @override
  State<BnSorobornoListScreen> createState() => _BnSorobornoListScreenState();
}

class _BnSorobornoListScreenState extends State<BnSorobornoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: ORANGE_PR,
        titleSpacing: 0,
        title: Text("স্বরবর্ণ"),
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
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemBuilder: (contex, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: GridItem(
                  index: index,
                ),
              );
            },
            itemCount: BanglaAlphabetVowels.length,
            itemExtent: 100,
          )

          // GridView.builder(
          //     itemCount: EngAlphabetBig.length,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 1,
          //       crossAxisSpacing: 10,
          //       mainAxisSpacing: 10,
          //     ),
          //     itemBuilder: (context, index) {
          //       return GridItem(index: index);
          //     }),
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
              builder: (context) => BnSorobornoItemScreen(itemNumber: index),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: ORANGE_2),
              child: Center(
                child: Text(
                  "${BanglaAlphabetVowels[index]}",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    color: ORANGE_PR,
                  ),
                ),
              ),
            ),
            Container(
              child: Text("${BanglaAlphabetVowelsWords[index]}",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: GREEN_PR)),
            ),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
                //border: Border.all(width: 1, color: PURPLE_PR),
                image: DecorationImage(
                  image:
                      AssetImage("assets/alphabet/bn/soroborno/${index}.png"),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
