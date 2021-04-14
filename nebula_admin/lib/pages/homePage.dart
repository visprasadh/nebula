import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nebula_admin/services/auth.dart';
import 'package:nebula_admin/services/firestore.dart';

import '../widgets/uploadButton.dart';
import '../widgets/header.dart';
import 'errorPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = Auth();

  Future authenticate() async {
    dynamic result = await _auth.signIn();
    if (result == null)
      Get.off(() => ErrorPage());
    else
      print('Logged in successfully');
  }

  File _image;
  final picker = ImagePicker();

  String _value;
  final categories = [
    'Architecture',
    'Aerial',
    'Macro',
    'Nature',
    'Miscellaneous',
  ];

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else
        print("No image selected");
    });
  }

  void buttonPress() => upload('linn_pic', 'gurushankar');

  void upload(String name, String photographer) {
    AddWallpaper addWallpaper = AddWallpaper(
      name: name,
      photographer: photographer,
      url: 'url',
      category: _value,
    );
    addWallpaper.addWallpaper();
    setState(() => _image = null);
  }

  @override
  void initState() {
    authenticate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(),
            Expanded(
              child: _image == null

                  // Add Image State

                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: getImage,
                        ),
                        Text(
                          'Add Wallpaper',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )

                  // Upload Image State

                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Image.file(
                              _image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: DropdownButton(
                                  value: _value,
                                  underline: SizedBox(),
                                  items: categories
                                      .map<DropdownMenuItem<String>>(
                                        (String value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ),
                                      )
                                      .toList(),
                                  hint: Text('Wallpaper Category'),
                                  onChanged: (value) =>
                                      setState(() => _value = value),
                                ),
                              ),
                              UploadButton(buttonPress),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
