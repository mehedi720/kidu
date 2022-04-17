import 'package:flutter/material.dart';
import 'package:kidu/screens/DashBoardScreen.dart';
import 'package:kidu/screens/LanguageSlection.dart';
import 'package:kidu/screens/NumberGameScreen.dart';
import 'package:kidu/screens/NumberLearningScreen.dart';
import 'package:kidu/screens/Personalize.dart';
import 'package:kidu/screens/PersonalizeBn.dart';
import 'package:kidu/screens/PoemSelectionPage.dart';
import 'package:kidu/screens/SinglePoemPage.dart';
import 'package:kidu/screens/flash_screen.dart';

void main() {
  runApp(KiduApp());
}

// contains the whole app
class KiduApp extends StatelessWidget {
  const KiduApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kidu",
      initialRoute: "PoemSelectionPage",
      routes: {
        "SplashScreen": (context) => FlashScreen(),
        "LanguageSlection": (context) => LanguageSlection(),
        "PersonalizeScreenEng": (context) => PersonalizeScreenEng(),
        "PersonalizeScreenBn": (context) => PersonalizeScreenBn(),
        "DashBoard": (context) => DashBoard(),
        "NumberLearningScreen": (context) => NumberLearningScreen(),
        "NumberGameScreen": (context) => NumberGameScreen(),
        "PoemSelectionPage": (context) => PoemSelectionPage(),
        "SinglePoemPage": (context) => SinglePoemPage(),
      },
    );
  }
}
