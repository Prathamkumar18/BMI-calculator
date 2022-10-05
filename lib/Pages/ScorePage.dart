import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:flutter_application_2/Utils/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class ScorePage extends StatelessWidget {
  final double bmiScore;
  final int age;
  String? bmiStatus;
  String? bmiDesc;
  Color? bmiColor;
  ScorePage({
    Key? key,
    required this.bmiScore,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        elevation: 30.0,
        shadowColor: context.accentColor,
        centerTitle: true,
        title: Text("BMI Score"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Card(
              elevation: 30.0,
              shadowColor: context.accentColor,
              child: Column(
                children: [
                  Text(
                    "Your Score:",
                    style: TextStyle(
                        color: context.accentColor,
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
                    valueWidget: Text(bmiScore.toStringAsFixed(1),
                        style: TextStyle(fontSize: 35)),
                    currentValue: bmiScore,
                    needleColor: Colors.blue,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              bmiStatus!,
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: bmiColor!),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              bmiDesc!,
              style: TextStyle(fontSize: 23, color: context.accentColor),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Re-calculate",
                style: TextStyle(fontSize: 20, color: context.canvasColor),
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
    if (bmiScore > 30) {
      bmiStatus = "Obese";
      bmiDesc = "Please Work to reduce Obesity.";
      bmiColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = "OverWeight";
      bmiDesc = "Do regular exercise & reduce the weight.";
      bmiColor = Colors.orange;
    } else if (bmiScore >= 18.4) {
      bmiStatus = "Normal";
      bmiDesc = "Enjoy,You are fit.";
      bmiColor = Colors.green;
    } else if (bmiScore < 18.4) {
      bmiStatus = "UnderWeight";
      bmiDesc = "Try to increase your weight";
      bmiColor = Colors.red;
    }
  }
}
