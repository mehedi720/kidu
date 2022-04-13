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
          seconds: 1,
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
          Image.asset("assets/img/flash_screen.png"),
        ],
      ),
    );
  }
}
