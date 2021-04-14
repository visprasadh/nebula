import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './pages/homePage.dart';
import './services/auth.dart';

void main() => runApp(NebulaAdmin());

class NebulaAdmin extends StatefulWidget {
  @override
  _NebulaAdminState createState() => _NebulaAdminState();
}

class _NebulaAdminState extends State<NebulaAdmin> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() => _initialized = true);
    } catch (e) {
      setState(() => _error = true);
    }
  }

  Widget error() {
    return Text('Something went wrong. Try again');
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) return error();
    if (!_initialized) return CircularProgressIndicator();
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: HomePage(),
    );
  }
}
