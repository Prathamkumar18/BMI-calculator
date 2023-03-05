// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_2/Utils/theme.dart';
import 'package:flutter_application_2/Utils/theme.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onChange;
  final int lightmode;

  HeightWidget(
    this.onChange,
    this.lightmode,
  );

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int _height = 150;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.lightmode == 1 ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(15),
      child: Card(
        shadowColor: context.accentColor,
        color: widget.lightmode == 1 ? lightbackground : darkbackground,
        elevation: 3.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
          child: Column(children: [
            Text(
              "Height:",
              style: TextStyle(
                  color: widget.lightmode == 1 ? Colors.black : Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${_height}",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: widget.lightmode == 1 ? Colors.blue : Colors.green,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "cm",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: widget.lightmode == 1 ? Colors.blue : Colors.green,
                  ),
                ),
              ],
            ),
            Slider(
                thumbColor: Color.fromARGB(255, 175, 76, 152),
                activeColor: Colors.white,
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
