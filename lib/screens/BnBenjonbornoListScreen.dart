import 'package:flutter/material.dart';
import 'package:kidu/screens/BnBenjonbornoItemScreen.dart';
import 'package:kidu/utility/banglaBornomal.dart';
import 'package:kidu/utility/constants.dart';

class BnBenjonbornoListScreen extends StatefulWidget {
  const BnBenjonbornoListScreen({Key? key}) : super(key: key);

  @override
  State<BnBenjonbornoListScreen> createState() =>
      _BnBenjonbornoListScreenState();
}

class _BnBenjonbornoListScreenState extends State<BnBenjonbornoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: ORANGE_PR,
        titleSpacing: 0,
        title: Text("ব্যঞ্জনবর্ণ"),
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
            itemCount: BanglaAlphabetConsonants.length,
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
              builder: (context) => BnBenjonbornoItemScreen(itemNumber: index),
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
                  "${BanglaAlphabetConsonants[index]}",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    color: ORANGE_PR,
                  ),
                ),
              ),
            ),
            Container(
              child: Text("${BanglaAlphabetConsonantsWords[index]}",
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
                      AssetImage("assets/alphabet/bn/benjonborno/${index}.png"),
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
