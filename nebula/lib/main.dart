import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './pages/welcomePage.dart';

void main() => runApp(Nebula());

class Nebula extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "Roboto"),
      home: WelcomePage(),
    );
  }
}
