import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/ScorePage.dart';
import 'package:flutter_application_2/Widgets/age_weight.dart';
import 'package:flutter_application_2/Widgets/gender_widgets.dart';
import 'package:flutter_application_2/Widgets/height_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

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
                Row(
                  children: [
                    AgeWeightWidget(
                        onChange: (ageVal) {
                          _age = ageVal;
                        },
                        title: "Age",
                        initValue: 30,
                        min: 0,
                        max: 100),
                    AgeWeightWidget(
                        onChange: (wtVal) {
                          _weight = wtVal;
                        },
                        title: "Weight(kg)",
                        initValue: 50,
                        min: 0,
                        max: 100),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                  child: SwipeableButtonView(
                      isFinished: _isFinished,
                      onFinish: () async {
                        await Navigator.push(
                            context,
                            PageTransition(
                                child:
                                    ScorePage(bmiScore: _bmiScore, age: _age),
                                type: PageTransitionType.fade));
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
                      activeColor: Colors.blue,
                      buttonWidget: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.green,
                      ),
                      buttonText: "CALCULATE"),
                )
              ],
            ),
          ),
        ));
  }

  void calculteBmi() {
    _bmiScore = _weight / (pow(_height / 100, 2));
  }
}
