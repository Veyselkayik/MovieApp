import 'package:flutter/material.dart';
import 'package:movie_project/mixin/color_mixin.dart';

class CustomTheme with ColorMixin {
  late ThemeData theme;
  CustomTheme() {
    theme = ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(backgroundColor: carolinaBlue,shadowColor: carolinaBlue),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: white),
            border: OutlineInputBorder(),
            fillColor: white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(style: BorderStyle.solid, color: white)),
            iconColor: white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(style: BorderStyle.solid, color: white),
            )),
        textTheme: TextTheme(
          headline4: TextStyle(color: white, fontWeight: FontWeight.bold),
          headline5: TextStyle(color: white, fontWeight: FontWeight.bold),
          headline6: TextStyle(color: white),
          subtitle1: TextStyle(color: white),

        ));
  }
}
