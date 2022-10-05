import 'dart:math';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 30.0,
          shadowColor: context.accentColor,
          title: Text(
            "BMI Calculator",
            style: TextStyle(
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 6.0),
            child: Card(
              shadowColor: context.accentColor,
              color: context.cardColor,
              shape: RoundedRectangleBorder(),
              elevation: 30.0,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  GenderWidgets(onChange: (genVal) {
                    _gender = genVal;
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  HeightWidgets(onChange: (htVal) {
                    _height = htVal;
                  }),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
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
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                    child: Card(
                      color: context.canvasColor,
                      elevation: 30.0,
                      shadowColor: context.accentColor,
                      child: SwipeableButtonView(
                          isFinished: _isFinished,
                          buttonColor: context.cardColor,
                          onFinish: () async {
                            await Navigator.push(
                                context,
                                PageTransition(
                                    child: ScorePage(
                                        bmiScore: _bmiScore, age: _age),
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
                          activeColor: context.canvasColor,
                          buttonWidget: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: context.accentColor,
                          ),
                          buttonText: "CALCULATE"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void calculteBmi() {
    _bmiScore = _weight / (pow(_height / 100, 2));
  }
}
