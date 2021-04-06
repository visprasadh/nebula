import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String label;

  CategoryTile(this.label);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            width: double.infinity,
            height: 150,
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
    );
  }
}
