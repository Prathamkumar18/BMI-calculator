import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        canvasColor: Color(0XFFEAEFF2),
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Color(0XFFDBDBDB),
        accentColor: Colors.black,
        primaryColor: Colors.black,
        highlightColor: Colors.red,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme,
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        buttonColor: Color.fromARGB(255, 23, 21, 79),
        highlightColor: Colors.green,
        primaryColor: Color.fromARGB(255, 29, 71, 194),
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: Color.fromARGB(255, 17, 24, 38),
        brightness: Brightness.dark,
        accentColor: Color.fromARGB(255, 80, 201, 248),
        appBarTheme: AppBarTheme(
          color: Colors.black,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
          textTheme: Theme.of(context).textTheme,
        ),
      );
}
