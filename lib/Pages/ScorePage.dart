// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Utils/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_2/Utils/theme.dart';

class ScorePage extends StatefulWidget {
  final double bmiScore;
  final int age;
  String? bmiStatus;
  String? bmiDesc;
  Color? bmiColor;
  final int lightmode;
  ScorePage({
    Key? key,
    required this.bmiScore,
    required this.age,
    this.bmiStatus,
    this.bmiDesc,
    this.bmiColor,
    required this.lightmode,
  }) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      backgroundColor: widget.lightmode == 1 ? lightbackground : darkbackground,
      appBar: AppBar(
        backgroundColor:
            widget.lightmode == 1 ? lightbackground : darkbackground,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "BMI Score",
          style: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: widget.lightmode == 1 ? Colors.black : Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: 400,
              width: 350,
              decoration: BoxDecoration(
                  color: widget.lightmode == 1 ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(15),
              child: Card(
                elevation: 3.0,
                color: widget.lightmode == 1 ? lightbackground : darkbackground,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                shadowColor: shadow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Your Score:",
                      style: TextStyle(
                          fontFamily: GoogleFonts.lato().fontFamily,
                          color: Colors.blue,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    PrettyGauge(
                      gaugeSize: 300,
                      minValue: 0,
                      maxValue: 40,
                      segments: [
                        GaugeSegment("UnderWeight", 18.5,
                            Color.fromARGB(255, 236, 84, 74)),
                        GaugeSegment("Normal", 6.4, Colors.green),
                        GaugeSegment("OverWeight", 5, Colors.orange),
                        GaugeSegment("Obese", 10.1, Colors.pink),
                      ],
                      valueWidget: Text(widget.bmiScore.toStringAsFixed(1),
                          style: TextStyle(fontSize: 35)),
                      currentValue: widget.bmiScore,
                      needleColor: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 160,
              width: 352,
              decoration: BoxDecoration(
                  color: widget.lightmode == 1 ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 3,
                shadowColor: shadow,
                color: widget.lightmode == 1 ? lightbackground : darkbackground,
                child: Column(children: [
                  Text(
                    widget.bmiStatus!,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: widget.bmiColor!),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 80,
                    width: 280,
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      widget.bmiDesc!,
                      style: TextStyle(fontSize: 23, color: Colors.blue),
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 280,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Re-calculate",
                  style: TextStyle(fontSize: 20, color: context.canvasColor),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }

  void setBmiInterpretation() {
    if (widget.bmiScore > 30) {
      widget.bmiStatus = "Obese";
      widget.bmiDesc = "Please Work to reduce Obesity.";
      widget.bmiColor = Colors.pink;
    } else if (widget.bmiScore >= 25) {
      widget.bmiStatus = "OverWeight";
      widget.bmiDesc = "Do regular exercise & reduce the weight.";
      widget.bmiColor = Colors.orange;
    } else if (widget.bmiScore >= 18.4) {
      widget.bmiStatus = "Normal";
      widget.bmiDesc = "Enjoy,You are fit.";
      widget.bmiColor = Colors.green;
    } else if (widget.bmiScore < 18.4) {
      widget.bmiStatus = "UnderWeight";
      widget.bmiDesc = "Try to increase your weight";
      widget.bmiColor = Colors.red;
    }
  }
}
