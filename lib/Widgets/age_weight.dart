import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                widget.title,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 10,
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
                      child: Icon(Icons.remove_circle_rounded,
                          color: Colors.blue)),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "${counter}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 15,
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
                      child:
                          Icon(Icons.add_circle_rounded, color: Colors.blue)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
