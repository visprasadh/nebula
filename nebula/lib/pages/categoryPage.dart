import 'package:flutter/material.dart';
import 'package:nebula/widgets/categoryTile.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 60, 15, 0),
              child: ListView(
                children: [
                  CategoryTile('Wildlife'),
                  CategoryTile('Architecture'),
                  CategoryTile('Landscape'),
                  CategoryTile('Texture'),
                  CategoryTile('Macro'),
                ],
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
                "Categories",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
