import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidu/utility/constants.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: ORANGE_PR,
        elevation: 0,
        title: Text("Kidu"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.menu,
              size: 32,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Color(0xFFFDF4E5),
                      shape: BoxShape.circle,
                    ),
                    //TODO:  kids image here
                    child: Image.asset("assets/img/personalizeScreen.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Greetings !!",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Kids Name",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                        color: ORANGE_PR),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 430,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: .75,
                crossAxisCount: 2,
                primary: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                clipBehavior: Clip.none,
                children: [
                  MainGridItem(
                      OnTap: () {
                        //TODO: had to add some thing
                        Navigator.pushNamed(context, "NumberLearningScreen");
                      },
                      BackgroundColor: GREEN_2,
                      ContentColor: GREEN_PR,
                      ImageLocation: "assets/img/number.png",
                      HeadLine: "Numbers",
                      SubHeadLine: "Learn to Count"),
                  MainGridItem(
                      OnTap: () {
                        //TODO: had to add some thing
                        Navigator.pushNamed(context, "EngAlphabetListScreen");
                      },
                      BackgroundColor: ORANGE_2,
                      ContentColor: ORANGE_PR,
                      ImageLocation: "assets/img/alphabet.png",
                      HeadLine: "Alphabet",
                      SubHeadLine: "Learn all the Letters"),
                  MainGridItem(
                      OnTap: () {
                        //TODO: had to add some thing
                      },
                      BackgroundColor: YELLOW_2,
                      ContentColor: YELLOW_PR,
                      ImageLocation: "assets/img/block.png",
                      HeadLine: "Words",
                      SubHeadLine: "Learn to Spell"),
                  MainGridItem(
                      OnTap: () {
                        //TODO: had to add some thing
                        Navigator.pushNamed(context, "PoemSelectionPage");
                      },
                      BackgroundColor: PURPLE_2,
                      ContentColor: PURPLE_PR,
                      ImageLocation: "assets/img/number.png",
                      HeadLine: "Poems",
                      SubHeadLine: "Learn some Rhymes"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MainGridItem extends StatelessWidget {
  var OnTap;
  Color BackgroundColor, ContentColor;
  String ImageLocation, HeadLine, SubHeadLine;
  MainGridItem(
      {Key? key,
      required this.OnTap,
      required this.BackgroundColor,
      required this.ContentColor,
      required this.ImageLocation,
      required this.HeadLine,
      required this.SubHeadLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: OnTap,
        child: Container(
          decoration: BoxDecoration(
            color: BackgroundColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    ImageLocation,
                    height: 80,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  HeadLine,
                  style: TextStyle(
                      color: ContentColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  SubHeadLine,
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
        ));
  }
}
