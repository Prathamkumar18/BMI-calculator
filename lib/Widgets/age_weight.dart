import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_2/Utils/theme.dart';
import 'package:flutter_application_2/Utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AgeWeightWidget extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;
  final lightmode;

  const AgeWeightWidget(
      {super.key,
      required this.onChange,
      required this.title,
      required this.initValue,
      required this.min,
      required this.max,
      required this.lightmode});

  @override
  State<AgeWeightWidget> createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 3.0,
      color: widget.lightmode == 1 ? lightbackground : darkbackground,
      shadowColor: context.accentColor,
      child: Container(
        height: 130,
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  color: widget.lightmode == 1 ? Colors.black : Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        if (counter > widget.min) {
                          counter--;
                        }
                        widget.onChange(counter);
                      });
                    },
                    child: Icon(Icons.arrow_back_ios,
                        size: 30, color: Color.fromARGB(255, 85, 135, 241))),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "${counter}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: context.primaryColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 12,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        if (counter < widget.max) {
                          counter++;
                        }
                        widget.onChange(counter);
                      });
                    },
                    child: Icon(Icons.arrow_forward_ios,
                        size: 30, color: Color.fromARGB(255, 85, 135, 241))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
