import 'dart:io';
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nebula_admin/services/auth.dart';
import 'package:nebula_admin/services/firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
  String _path;
  String _name;
  String _photographer;
  bool _loading = false;
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
        _path = pickedFile.path;
        _image = File(_path);
        print("This is the way: $_path");
      } else
        print("No image selected");
    });
  }

  Future<String> uploadFile(String filePath) async {
    File file = File(filePath);
    Random random = new Random();
    UploadTask uploadTask;
    try {
      uploadTask = FirebaseStorage.instance
          .ref('wallpapers/$_value${random.nextInt(9999)}')
          .putFile(file);
    } on FirebaseException catch (e) {
      print('Firebase Storage Error: $e');
    }

    var downUrl =
        await (await uploadTask.whenComplete(() => null)).ref.getDownloadURL();
    String url = downUrl.toString();
    print("File uploaded to url: $url");
    return url;
  }

  void buttonPress() async {
    _showLoader();
    String url = await uploadFile(_path);
    await upload(_name, _photographer, url);
    _loading = false;
    Get.back();
    Get.back();
  }

  Future<void> upload(String name, String photographer, String url) async {
    AddWallpaper addWallpaper = AddWallpaper(
      name: name,
      photographer: photographer,
      url: url,
      category: _value,
    );
    addWallpaper.addWallpaper();
    setState(() => _image = null);
  }

  void _showLoader() {
    showDialog(
      context: context,
      builder: (BuildContext context) => Container(
        color: Colors.white,
        height: 150,
        width: 150,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Add Information'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (text) => _name = text,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              onChanged: (text) => _photographer = text,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: 'Photographer'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: UploadButton(buttonPress),
            ),
          ],
        ),
      ),
    );
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
                              UploadButton(_showDialog),
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
