import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class RoundedEditText extends StatelessWidget {

  final hint;
  final color;

  RoundedEditText(this.hint, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: kEditTextDecoration.copyWith(hintText: hint),
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }
}