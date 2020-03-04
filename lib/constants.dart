import 'package:flutter/material.dart';

const kEditTextDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0))
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
    borderSide: BorderSide(width: 1.0, color: Colors.lightBlueAccent)
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
      borderSide: BorderSide(width: 2.0, color: Colors.lightBlueAccent)
  ),
  contentPadding: EdgeInsets.all(20.0),
);

const kMessageTextDecoration = InputDecoration(

  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1.0, color: Colors.lightBlueAccent)
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: Colors.lightBlueAccent)
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
);