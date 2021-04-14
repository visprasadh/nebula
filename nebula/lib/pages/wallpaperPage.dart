import 'package:flutter/material.dart';

class WallpaperPage extends StatelessWidget {
  final String category;
  WallpaperPage(this.category);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(category),
    );
  }
}
