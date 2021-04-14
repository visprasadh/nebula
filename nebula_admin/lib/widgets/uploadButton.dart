import 'package:flutter/material.dart';

class UploadButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 13,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Text(
          'Upload',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}
