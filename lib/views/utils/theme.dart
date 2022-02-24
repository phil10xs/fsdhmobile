import 'package:flutter/material.dart';

ThemeData theme(BuildContext context) => ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        bodyText1: const TextStyle(
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
          // height: 1.5,
        ),
        bodyText2: const TextStyle(
          decoration: TextDecoration.none,
          fontStyle: FontStyle.normal,
        ),
        headline4: ThemeData.light().textTheme.headline4!.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
              fontStyle: FontStyle.normal,
            ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Colors.blue),
        ),
        buttonColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textTheme: ButtonTextTheme.primary,
        disabledColor: Colors.grey,
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      primaryIconTheme: IconThemeData(color: Colors.black),
      cardTheme: CardTheme(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Color(0x0FFEDF2F7), width: 1),
        ),
        elevation: 0,
      ),
      dialogTheme: DialogTheme.of(context).copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Color(0x0FFEDF2F7), width: 1),
        ),
      ),
      appBarTheme: AppBarTheme.of(context).copyWith(
        color: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        textTheme: const TextTheme(
          headline6: TextStyle(color: Colors.black38, fontSize: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        border: UnderlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        hintStyle: TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.normal,
          fontSize: 12,
          height: 1.6,
        ),
      ),
    );
