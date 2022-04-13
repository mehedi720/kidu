import 'package:flutter/material.dart';

class ButtonSmall extends StatelessWidget {
  var OnTap;
  String Content;
  Color BackgroundColor, ContentColor;

  ButtonSmall(
      {Key? key,
      required this.OnTap,
      required this.Content,
      required this.BackgroundColor,
      required this.ContentColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: OnTap,
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            color: BackgroundColor, borderRadius: BorderRadius.circular(5.0)),
        child: Center(
          child: Text(
            Content,
            style: TextStyle(
                color: ContentColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
