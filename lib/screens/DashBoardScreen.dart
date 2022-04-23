import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kidu/utility/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

String preferLanguage = "English";
String ImagePath = " ";
List banglaCon = [
  "সংখ্যা",
  "সংখ্যা গণনা শিখি",
  "বর্ণমালা",
  "আসো বর্ণ শিখি",
  "গণিত",
  "হিসাব করতে শিখি",
  "ছড়া",
  "কিছু সুন্দর ছড়া"
];
List EngCon = [
  "Numbers",
  "Learn to Count",
  "Alphabet",
  "Learn all the Letters",
  "Math",
  "Learn to Calculate",
  "Poems",
  "Learn some Rhymes"
];
List mainCon = EngCon;

class DashBoard extends StatefulWidget {
  String? m;
  DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  SharedPreferences? storage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      storage = await SharedPreferences.getInstance();
      widget.m = storage?.getString("kidName");
      ImagePath = storage?.getString("img") ?? " ";
      setState(() {
        widget.m;
        ImagePath;
      });

      //language

      String? lang = storage?.getString("language");
      if (preferLanguage != lang) {
        setState(() {
          preferLanguage = lang!;
          mainCon = banglaCon;
        });
      }
      ;
    });
  }

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
            child: GestureDetector(
              onTap: () {
                if (preferLanguage == "English") {
                  setState(() {
                    preferLanguage = "Bangla";
                  });
                } else {
                  setState(() {
                    preferLanguage = "English";
                  });
                }

                if (preferLanguage == "Bangla") {
                  setState(() {
                    mainCon = banglaCon;
                  });
                } else {
                  setState(() {
                    mainCon = EngCon;
                  });
                }
              },
              child: Icon(
                Icons.translate,
                size: 28,
              ),
            ),
          ),

          //popup menu
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "Settings");
                  },
                  child: ListTile(
                    title: Text("Settings"),
                  ),
                ),
              ),
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
                    child: ImagePath == " "
                        ? Image.asset("assets/img/personalizeScreen.png")
                        : Image.file(File(ImagePath)),
                    // Image.asset("assets/img/personalizeScreen.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Helloo !!",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        fontFamily: "inter",
                        fontStyle: FontStyle.normal),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.m?.toUpperCase() ?? " lol",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 36,
                        color: ORANGE_PR,
                        fontFamily: "concertOne",
                        letterSpacing: 3.0),
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
                        if (preferLanguage == "Bangla") {
                          Navigator.pushNamed(
                              context, "BnNumberLearningScreen");
                        } else {
                          Navigator.pushNamed(context, "NumberLearningScreen");
                        }
                      },
                      BackgroundColor: GREEN_2,
                      ContentColor: GREEN_PR,
                      ImageLocation: "assets/img/number.png",
                      HeadLine: mainCon[0],
                      SubHeadLine: mainCon[1]),
                  MainGridItem(
                      OnTap: () {
                        //TODO: had to add some thing
                        if (preferLanguage == "Bangla") {
                          Navigator.pushNamed(
                              context, "BanglaAlphabetSelectionScreen");
                        } else {
                          Navigator.pushNamed(context, "EngAlphabetListScreen");
                        }
                      },
                      BackgroundColor: ORANGE_2,
                      ContentColor: ORANGE_PR,
                      ImageLocation: "assets/img/alphabet.png",
                      HeadLine: mainCon[2],
                      SubHeadLine: mainCon[3]),
                  MainGridItem(
                      OnTap: () {
                        //TODO: had to add some thing
                        if (preferLanguage == "Bangla") {
                          Navigator.pushNamed(
                              context, "MathLearningScreenBangla");
                        } else {
                          Navigator.pushNamed(context, "MathLearningScreen");
                        }
                      },
                      BackgroundColor: YELLOW_2,
                      ContentColor: YELLOW_PR,
                      ImageLocation: "assets/img/block.png",
                      HeadLine: mainCon[4],
                      SubHeadLine: mainCon[5]),
                  MainGridItem(
                      OnTap: () {
                        //TODO: had to add some thing
                        if (preferLanguage == "Bangla") {
                          Navigator.pushNamed(
                              context, "BanglaPoemSelectionPage");
                        } else {
                          Navigator.pushNamed(context, "PoemSelectionPage");
                        }
                      },
                      BackgroundColor: PURPLE_2,
                      ContentColor: PURPLE_PR,
                      ImageLocation: "assets/img/humpty.png",
                      HeadLine: mainCon[6],
                      SubHeadLine: mainCon[7]),
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
