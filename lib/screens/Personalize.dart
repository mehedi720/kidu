import 'package:flutter/material.dart';
import 'package:kidu/components/buttons.dart';
import 'package:kidu/components/inputs.dart';
import 'package:kidu/utility/constants.dart';

class PersonalizeScreenEng extends StatefulWidget {
  const PersonalizeScreenEng({Key? key}) : super(key: key);

  @override
  State<PersonalizeScreenEng> createState() => _PersonalizeScreenEngState();
}

class _PersonalizeScreenEngState extends State<PersonalizeScreenEng> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 50, top: 20),
                child: Center(
                  child: Text(
                    "Personalize this app",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.blueGrey.shade700,
                    ),
                  ),
                ),
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextInput(
                        LabelText: "Kids Name",
                        BackgroundColor: ORANGE_2,
                        ContentColor: ORANGE_PR),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextInput(
                        LabelText: "AGE",
                        BackgroundColor: ORANGE_2,
                        ContentColor: ORANGE_PR),
                    SizedBox(
                      height: 20.0,
                    ),
                    ButtonSmall(
                        OnTap: () {
                          //TODO: have to initiate
                          Navigator.pushNamedAndRemoveUntil(context,
                              "DashBoard", (route) => route == "SplashScreen");
                        },
                        Content: "Lets learn",
                        BackgroundColor: GREEN_2,
                        ContentColor: GREEN_PR),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Image.asset("assets/img/personalizeScreen.png"),
            ],
          ),
        ),
      ),
    ));
  }
}
