import 'package:flutter/material.dart';
import 'package:orange_project/layout/splash_screen/spalsh_screen.dart';
import 'package:orange_project/shared/Styles/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: lightthemes,
      debugShowCheckedModeBanner: false,
      home:SplashSCreen(),
    );
  }
}

