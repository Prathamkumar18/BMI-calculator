import 'dart:math';
import 'package:flutter_application_2/Utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/ScorePage.dart';
import 'package:flutter_application_2/Widgets/age_weight.dart';
import 'package:flutter_application_2/Widgets/gender_widgets.dart';
import 'package:flutter_application_2/Widgets/height_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:flutter_application_2/Utils/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0.0;
  int lightmode = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightmode == 1 ? lightbackground : darkbackground,
      appBar: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    lightmode ^= 1;
                  });
                },
                icon: Icon(
                  Icons.light,
                  size: 40,
                  color: lightmode == 1 ? Colors.black : Colors.white,
                )),
          )
        ],
        backgroundColor: lightmode == 1 ? lightbackground : darkbackground,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: lightmode == 1 ? Colors.black : Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 170,
              width: 350,
              child: Card(
                elevation: 0,
                color: lightmode == 1 ? Colors.white : Colors.black,
                child: GenderWidgets(
                    onChange: (genVal) {
                      _gender = genVal;
                    },
                    lightmode: lightmode),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 170,
              width: 350,
              decoration: BoxDecoration(
                  color: lightmode == 1 ? Colors.white : Colors.black),
              child: HeightWidget((htVal) {
                _height = htVal;
              }, lightmode),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 180,
              width: 355,
              color: lightmode == 1 ? Colors.white : Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AgeWeightWidget(
                    onChange: (ageVal) {
                      _age = ageVal;
                    },
                    title: "Age",
                    initValue: 30,
                    min: 0,
                    max: 100,
                    lightmode: lightmode,
                  ),
                  AgeWeightWidget(
                    onChange: (wtVal) {
                      _weight = wtVal;
                    },
                    title: "Weight",
                    initValue: 50,
                    min: 0,
                    max: 100,
                    lightmode: lightmode,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 90,
              width: 350,
              color: lightmode == 1 ? Colors.white : Colors.black,
              padding: EdgeInsets.all(15),
              child: SwipeableButtonView(
                  isFinished: _isFinished,
                  buttonColor: lightmode == 1 ? Colors.black : Colors.white,
                  onFinish: () async {
                    await Navigator.push(
                        context,
                        PageTransition(
                            child: ScorePage(bmiScore: _bmiScore, age: _age, lightmode: lightmode,),
                            type: PageTransitionType.fade,));
                    setState(() {
                      _isFinished = false;
                    });
                  },
                  onWaitingProcess: () {
                    calculteBmi();
                    Future.delayed(Duration(seconds: 1), () {
                      setState(() {
                        _isFinished = true;
                      });
                    });
                  },
                  activeColor:
                      lightmode == 1 ? lightbackground : darkbackground,
                  buttonWidget: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.blue,
                  ),
                  buttonText: "CALCULATE"), 
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  void calculteBmi() {
    _bmiScore = _weight / (pow(_height / 100, 2));
  }
}
