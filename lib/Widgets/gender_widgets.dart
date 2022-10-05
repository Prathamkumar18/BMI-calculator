import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:flutter_application_2/Utils/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class GenderWidgets extends StatefulWidget {
  final Function(int) onChange;

  const GenderWidgets({super.key, required this.onChange});

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
          elevation: 10.0,
          shadowColor: context.accentColor,
          child: ChoiceChip3D(
              border: Border.all(
                  width: 1.0,
                  color: context.primaryColor,
                  style: (_gender == 1) ? BorderStyle.solid : BorderStyle.none),
              style: ChoiceChip3DStyle(
                  backColor: context.accentColor,
                  topColor: context.canvasColor),
              height: 110,
              width: 110,
              onSelected: () {
                setState(() {
                  _gender = 1;
                });
                widget.onChange(_gender);
              },
              selected: _gender == 1,
              onUnSelected: () {},
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    "Assets/Images/male1.png",
                    height: 72,
                    width: 72,
                  ),
                  Text(
                    "Male",
                    style: TextStyle(color: context.accentColor),
                  ),
                ],
              )),
        ),
        SizedBox(
          width: 60,
        ),
        Card(
          elevation: 18.0,
          shadowColor: context.accentColor,
          child: ChoiceChip3D(
              height: 110,
              width: 110,
              border: Border.all(
                  color: context.primaryColor,
                  width: 1.0,
                  style: (_gender == 2) ? BorderStyle.solid : BorderStyle.none),
              style: ChoiceChip3DStyle(
                  backColor: context.accentColor,
                  topColor: context.canvasColor),
              onSelected: () {
                setState(() {
                  _gender = 2;
                });
                widget.onChange(_gender);
              },
              selected: _gender == 2,
              onUnSelected: () {},
              child: Column(
                children: [
                  SizedBox(
                    height: 3,
                  ),
                  Image.asset(
                    "Assets/Images/female1.png",
                    height: 72,
                    width: 72,
                  ),
                  Text("Female", style: TextStyle(color: context.accentColor)),
                ],
              )),
        ),
      ],
    );
  }
}
