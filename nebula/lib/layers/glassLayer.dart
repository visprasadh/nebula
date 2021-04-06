import 'dart:ui';

import 'package:flutter/material.dart';

class GlassLayer extends StatelessWidget {
  final double blurStrength = 75;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurStrength, sigmaY: blurStrength),
        child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.blueGrey.withOpacity(0.3)),
      ),
    );
  }
}
