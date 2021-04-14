import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'nebula',
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            'ADMIN',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              letterSpacing: 5,
            ),
          ),
        ],
      ),
    );
  }
}
