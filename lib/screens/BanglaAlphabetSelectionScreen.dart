import 'package:flutter/material.dart';

import '../components/buttons.dart';
import '../utility/constants.dart';

class BanglaAlphabetSelectionScreen extends StatelessWidget {
  const BanglaAlphabetSelectionScreen({Key? key}) : super(key: key);

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
                    child: Container(
                      height: 250.0,
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "বাংলা বর্ণমালা দুই প্রকার",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.blueGrey.shade700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ButtonSmall(
                        BackgroundColor: ORANGE_2,
                        ContentColor: ORANGE_PR,
                        Content: "স্বরবর্ণ",
                        OnTap: () {
//TODO:  have to implement shared preferences
                          Navigator.pushNamed(context, "BnSorobornoListScreen");
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
                            Navigator.pushNamed(
                                context, "BnBenjonbornoListScreen");
                          },
                          Content: "ব্যঞ্জনবর্ণ",
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
