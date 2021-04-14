import 'package:flutter/material.dart';

import './pages/homePage.dart';

void main() => runApp(NebulaAdmin());

class NebulaAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
