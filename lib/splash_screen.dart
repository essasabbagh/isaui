import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

class MainSplashScreen extends StatefulWidget {
  @override
  _MainSplashScreenState createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new SplashScreen(
            seconds: 14,
            // navigateAfterSeconds: new AfterSplash(),
            title: Text('Welcome In SplashScreen'),
            image: Image.network('https://picsum.photos/200'),
            backgroundColor: Colors.white,
            styleTextUnderTheLoader: new TextStyle(),
            photoSize: 100.0,
            loaderColor: Colors.red),
      ),
    );
  }
}
