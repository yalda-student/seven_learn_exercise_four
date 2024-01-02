import 'package:flutter/material.dart';
import 'package:seven_learn_exercise_four/gen/fonts.gen.dart';

ThemeData appTheme = ThemeData(
    fontFamily: FontFamily.comicSans,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xff2D3250),
        titleTextStyle: TextStyle(
            fontSize: 22,
            fontFamily: FontFamily.comicSans,
            color: Colors.white)),
    colorScheme: const ColorScheme.dark(
      background: Color(0xff2D3250),
      primary: Color(0xffF6B17A),
      secondary: Color(0xff7077A1),
      surface: Color(0xff424769),
    ),
    popupMenuTheme: PopupMenuThemeData(
        color: const Color(0xff2D3250),
        position: PopupMenuPosition.under,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: const Color(0xff7077A1).withOpacity(.4)),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        )),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _textFieldBorder,
      focusedBorder: _textFieldBorder,
      border: _textFieldBorder,
      errorBorder: _errorFieldBorder,
      focusedErrorBorder: _errorFieldBorder,
      errorMaxLines: null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    ));

final _textFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: Color(0xff7077A1), width: 2),
);
final _errorFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: Color(0xffB60101), width: 2),
);
