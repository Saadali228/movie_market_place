import 'package:flutter/material.dart';

BoxDecoration backgroundGradient = const BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color(0xff322043),
      Color(0xff1F0C3F),
    ],
    stops: [0.0, 1.0],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    tileMode: TileMode.repeated,
  ),
);