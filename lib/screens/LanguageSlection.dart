import 'package:flutter/material.dart';
import 'package:kidu/components/buttons.dart';
import 'package:kidu/utility/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSlection extends StatefulWidget {
  const LanguageSlection({Key? key}) : super(key: key);

  @override
  State<LanguageSlection> createState() => _LanguageSlectionState();
}

class _LanguageSlectionState extends State<LanguageSlection> {
  getEngSorage() async {
    final storage = await SharedPreferences.getInstance();
    storage.setString("language", "English");
  }

  getBnSorage() async {
    final storage = await SharedPreferences.getInstance();
    storage.setString("language", "Bangla");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/kite.png"),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      height: 30.0,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Choose Your Mother Language",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.blueGrey.shade700,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonSmall(
                        BackgroundColor: ORANGE_2,
                        ContentColor: ORANGE_PR,
                        Content: "English",
                        OnTap: () {
//TODO:  have to implement shared preferences
                          getEngSorage();

                          Navigator.pushNamed(context, "PersonalizeScreenEng");
                        },
                      ),
                      // Divider(
                      //   color: ORANGE_PR,
                      //   height: 20,
                      //   thickness: 2.5,
                      //   indent: 80,
                      //   endIndent: 80,
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      ButtonSmall(
                          OnTap: () {
                            //TODO:  have to implement shared preferences
                            getBnSorage();
                            Navigator.pushNamed(context, "PersonalizeScreenBn");
                          },
                          Content: "বাংলা",
                          BackgroundColor: PURPLE_2,
                          ContentColor: PURPLE_PR),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
