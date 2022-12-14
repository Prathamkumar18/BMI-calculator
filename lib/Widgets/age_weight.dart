import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Utils/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class AgeWeightWidget extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;

  const AgeWeightWidget(
      {super.key,
      required this.onChange,
      required this.title,
      required this.initValue,
      required this.min,
      required this.max});

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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Card(
        elevation: 30.0,
        color: context.canvasColor,
        shadowColor: context.accentColor,
        shape: RoundedRectangleBorder(),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                widget.title,
                style: TextStyle(color: context.accentColor, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
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
                      child: Icon(Icons.remove_circle_outline,
                          color: Colors.greenAccent)),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${counter}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: context.primaryColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 6,
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
                      child: Icon(Icons.add_circle_outline,
                          color: Colors.greenAccent)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
