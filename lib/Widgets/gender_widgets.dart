import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

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
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
              border: Border.all(
                  width: 1.0,
                  color: Colors.blue,
                  style: (_gender == 1) ? BorderStyle.solid : BorderStyle.none),
              style: ChoiceChip3DStyle(
                  backColor: Colors.grey, topColor: Colors.white),
              height: 100,
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
                  Image.asset(
                    "Assets/Images/male.png",
                    height: 72,
                    width: 72,
                  ),
                  Text("Male"),
                ],
              )),
          SizedBox(
            width: 60,
          ),
          ChoiceChip3D(
              height: 100,
              border: Border.all(
                  color: Colors.blue,
                  width: 1.0,
                  style: (_gender == 2) ? BorderStyle.solid : BorderStyle.none),
              style: ChoiceChip3DStyle(
                  backColor: Colors.grey, topColor: Colors.white),
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
                  Image.asset(
                    "Assets/Images/female.png",
                    height: 72,
                    width: 72,
                  ),
                  Text("Female"),
                ],
              )),
        ],
      ),
    );
  }
}
