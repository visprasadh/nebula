import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String label;
  final Function onPressed;

  CategoryTile(this.label, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(label),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.purple],
                  stops: [0, 1],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: double.infinity,
              height: 250,
              child: ClipRRect(
                child: Image(
                  image: AssetImage('assets/images/$label.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 5),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
