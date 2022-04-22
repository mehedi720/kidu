import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  var contrl;
  String LabelText;
  Color BackgroundColor, ContentColor;
  TextInput(
      {Key? key,
      required this.LabelText,
      required this.BackgroundColor,
      required this.ContentColor,
      this.contrl})
      : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.contrl,
      style: TextStyle(
          color: Colors.grey.shade900,
          fontWeight: FontWeight.w800,
          fontSize: 18,
          wordSpacing: 1.5),
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: 60,
          maxWidth: 280,
        ),
        label: Text(
          widget.LabelText,
          style: TextStyle(color: widget.ContentColor),
        ),
        filled: true,
        fillColor: widget.BackgroundColor,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            style: BorderStyle.none,
            color: widget.ContentColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.ContentColor),
        ),
        enabledBorder: InputBorder.none,
      ),
    );
  }
}
