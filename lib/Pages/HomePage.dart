import 'package:flutter/material.dart';
import 'package:flutter_application_2/Widgets/gender_widgets.dart';
import 'package:flutter_application_2/Widgets/height_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _gender = 0;
  int _height = 150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "BMI Calculator",
            style: TextStyle(
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(),
            elevation: 12,
            child: Column(
              children: [
                GenderWidgets(onChange: (genVal) {
                  _gender = genVal;
                }),
                HeightWidgets(onChange: (htVal) {
                  _height = htVal;
                }),
              ],
            ),
          ),
        ));
  }
}
