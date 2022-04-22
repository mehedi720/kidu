import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(
          seconds: 3,
        ), () async {
      SharedPreferences st = await SharedPreferences.getInstance();
      var language = st.getString("language");
      var name = st.getString("kidName");
      var age = st.getString("Age");
      if (language != null && name != null) {
        Navigator.pushReplacementNamed(context, "DashBoard");
      } else {
        Navigator.pushReplacementNamed(context, 'LanguageSlection');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(
          "assets/img/kidu.gif",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          scale: 0.12,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
