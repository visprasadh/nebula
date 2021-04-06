import 'package:flutter/material.dart';

import './pages/welcomePage.dart';

void main() => runApp(Nebula());

class Nebula extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}
