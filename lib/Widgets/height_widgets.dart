import 'package:flutter/material.dart';

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
        elevation: 5,
        shape: RoundedRectangleBorder(),
        child: Container(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Height:",
              style: TextStyle(
                  color: Colors.blue,
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
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "cm",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            Slider(
                thumbColor: Colors.green,
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
