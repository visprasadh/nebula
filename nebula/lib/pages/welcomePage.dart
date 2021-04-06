import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nebula/layers/colorLayer.dart';
import 'package:nebula/layers/glassLayer.dart';
import 'package:nebula/layers/textLayer.dart';
import 'package:nebula/pages/categoryPage.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          ColorLayer(),
          GlassLayer(),
          TextLayer(),
          TextButton(
            child: Container(),
            onPressed: () => Get.off(CategoryPage()),
          ),
        ],
      ),
    );
  }
}
