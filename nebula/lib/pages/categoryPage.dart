import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nebula/pages/wallpaperPage.dart';
import 'package:nebula/widgets/categoryTile.dart';

class CategoryPage extends StatelessWidget {
  void onPressed(String category) {
    Get.to(WallpaperPage(category));
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Nature',
      'Architecture',
      'Aerial',
      'Macro',
      'Miscellaneous',
    ];

    final Shader linearGradient = LinearGradient(
      colors: <Color>[
        Colors.orange,
        Colors.red,
        Colors.purple,
        Colors.blue,
      ],
    ).createShader(Rect.fromLTWH(0.0, 0.0, Get.context.width, 500.0));

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 60, 15, 0),
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) => CategoryTile(
                  categories[index],
                  onPressed,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              color: Theme.of(context).canvasColor,
              child: Text(
                "nebula",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 28,
                    letterSpacing: 1.5,
                    foreground: Paint()..shader = linearGradient,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
