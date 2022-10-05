import 'package:flutter/material.dart';
import 'package:flutter_application_2/Utils/theme.dart';
import 'package:flutter_application_2/Utils/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HeightWidgets extends StatefulWidget {
  final Function(int) onChange;

  const HeightWidgets({super.key, required this.onChange});

  @override
  State<HeightWidgets> createState() => _HeightWidgetsState();
}

class _HeightWidgetsState extends State<HeightWidgets> {
  int _height = 150;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        color: context.canvasColor,
        elevation: 30.0,
        shadowColor: context.accentColor,
        shape: RoundedRectangleBorder(),
        child: Container(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Height:",
              style: TextStyle(
                  color: context.accentColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${_height}",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: context.primaryColor),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "cm",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: context.primaryColor),
                ),
              ],
            ),
            Slider(
                thumbColor: Color.fromARGB(255, 175, 76, 152),
                activeColor: context.cardColor,
                inactiveColor: Color.fromARGB(255, 68, 139, 216),
                min: 0,
                max: 250,
                value: _height.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _height = value.toInt();
                  });
                  widget.onChange(_height);
                }),
          ]),
        ),
      ),
    );
  }
}
