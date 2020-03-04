import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final title;
  final backColor;
  final onClick;

  RoundedButton({this.title, this.backColor, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(50.0),
        color: backColor,
        child: MaterialButton(
          padding: EdgeInsets.all(20.0),
          height: 45.0,
          onPressed: onClick,
          child: Text(
            title.toUpperCase(),
          ),
        ),
      ),
    );
  }
}
