import 'package:flutter/material.dart';
import 'package:kidu/components/buttons.dart';
import 'package:kidu/components/inputs.dart';
import 'package:kidu/utility/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalizeScreenBn extends StatefulWidget {
  const PersonalizeScreenBn({Key? key}) : super(key: key);

  @override
  State<PersonalizeScreenBn> createState() => _PersonalizeScreenBnState();
}

class _PersonalizeScreenBnState extends State<PersonalizeScreenBn> {
  final _formkey = GlobalKey<FormState>();
  var nameCntrl = TextEditingController();
  var ageCntrl = TextEditingController();
  setAgeName(String name, String age) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString("kidName", name);
    storage.setString("kidAge", age);
  }

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
                    "শিশুর পরিচিতি",
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
                        contrl: nameCntrl,
                        LabelText: "শিশুর নাম",
                        BackgroundColor: PURPLE_2,
                        ContentColor: PURPLE_PR),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextInput(
                        contrl: ageCntrl,
                        LabelText: "বয়স",
                        BackgroundColor: PURPLE_2,
                        ContentColor: PURPLE_PR),
                    SizedBox(
                      height: 20.0,
                    ),
                    ButtonSmall(
                        OnTap: () {
                          //TODO: have to initiate in bangla
                          if (ageCntrl.text != null && nameCntrl.text != null) {
                            this.setAgeName(nameCntrl.text, ageCntrl.text);
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                "DashBoard",
                                (route) => route == "SplashScreen");
                          }
                        },
                        Content: "শুরু করুন",
                        BackgroundColor: GREEN_2,
                        ContentColor: GREEN_PR),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Image.asset("assets/img/personalizeScreenBn.png"),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ageCntrl.dispose();
    nameCntrl.dispose();
  }
}
