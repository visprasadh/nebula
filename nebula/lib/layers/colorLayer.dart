import 'package:flutter/material.dart';

class ColorLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(),
      child: Container(),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var one = Paint()
      ..color = Colors.indigo
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var two = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var three = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(Offset(size.width / 1.5, size.height / 2), 400, one);
    canvas.drawCircle(Offset(size.width / 3, size.height / 8), 250, two);
    canvas.drawCircle(Offset(size.width / 1.7, size.height / 1.1), 250, three);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
