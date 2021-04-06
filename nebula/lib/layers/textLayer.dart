import 'package:flutter/material.dart';

class TextLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Text(
              "Tap anywhere to get started",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Text(
              "nebula",
              style: TextStyle(
                fontSize: 42,
                fontFamily: "Poppins",
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
