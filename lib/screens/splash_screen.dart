import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_photo_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadSplashScreen();
  }

  _loadSplashScreen() async {
    await Future.delayed(Duration(seconds: 3)); // Adjust the duration as needed
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              AddPhotoPage()), // Replace with your main screen widget
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
            'assets/images/splash .png'), // Replace with your splash screen image asset
      ),
    );
  }
}
