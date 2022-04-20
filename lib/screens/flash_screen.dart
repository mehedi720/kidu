import 'dart:async';

import 'package:flutter/material.dart';

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
        ),
        () => {
              Navigator.pushReplacementNamed(context, 'LanguageSlection'),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            "assets/img/kidu.gif",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            scale: 0.12,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
