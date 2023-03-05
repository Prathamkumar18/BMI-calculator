// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:flutter_application_2/Utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_2/Utils/theme.dart';

class GenderWidgets extends StatefulWidget {
  final Function(int) onChange;
  final lightmode;

  const GenderWidgets({
    Key? key,
    required this.onChange,
    required this.lightmode,
  }) : super(key: key);

  @override
  State<GenderWidgets> createState() => _GenderWidgetsState();
}

class _GenderWidgetsState extends State<GenderWidgets> {
  int _gender = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 3.0,
          shadowColor: shadow,
          child: ChoiceChip3D(
              border: Border.all(
                  width: 1.0,
                  color: widget.lightmode == 1 ? Colors.black : Colors.white,
                  style: (_gender == 1) ? BorderStyle.solid : BorderStyle.none),
              style: ChoiceChip3DStyle(
                  backColor: Colors.grey, topColor: context.canvasColor),
              height: 126,
              width: 126,
              onSelected: () {
                setState(() {
                  _gender = 1;
                });
                widget.onChange(_gender);
              },
              selected: _gender == 1,
              onUnSelected: () {},
              child: Container(
                color: widget.lightmode == 1 ? lightbackground : darkbackground,
                height: 112,
                width: 121,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Image.asset(
                      "Assets/Images/male1.png",
                      height: 80,
                      width: 80,
                    ),
                    Text(
                      "Male",
                      style: TextStyle(
                          fontSize: 15,
                          color: widget.lightmode == 1
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
        ),
        SizedBox(
          width: 40,
        ),
        Card(
          elevation: 3.0,
          shadowColor: shadow,
          child: ChoiceChip3D(
              height: 126,
              width: 126,
              border: Border.all(
                  width: 1.0,
                  color: widget.lightmode == 1 ? Colors.black : Colors.white,
                  style: (_gender == 2) ? BorderStyle.solid : BorderStyle.none),
              style: ChoiceChip3DStyle(
                  backColor: Colors.grey, topColor: context.canvasColor),
              onSelected: () {
                setState(() {
                  _gender = 2;
                });
                widget.onChange(_gender);
              },
              selected: _gender == 2,
              onUnSelected: () {},
              child: Container(
                color: widget.lightmode == 1 ? lightbackground : darkbackground,
                height: 112,
                width: 121,
                child: Column(
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Image.asset(
                      "Assets/Images/female1.png",
                      height: 80,
                      width: 80,
                    ),
                    Text("Female",
                        style: TextStyle(
                            fontSize: 15,
                            color: widget.lightmode == 1
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
