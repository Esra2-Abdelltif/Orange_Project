import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange_project/layout/home_layout/home_layout.dart';
import 'package:orange_project/modules/on_boarding_screen/on_boardin_screen.dart';

class SplashSCreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Widget widget;
    // bool onBoarding =CacheHelper.getDate(key:'onBoarding');
    // String token =CacheHelper.getDate(key: 'token');
    //
    // if(onBoarding != null)
    // {
    //   if(token!=null) widget= HomeLayout();
    //   else widget =WelcomeScreen();
    // }
    // else{
    //   OnBoardinScreen();
    // }
    // print(onBoarding);
    return  AnimatedSplashScreen(
      duration: 400,
      splash: Image.asset('assets/images/Logo .png',),
      nextScreen: OnBoardinScreen(),
      splashIconSize: 250,
      splashTransition: SplashTransition.slideTransition,


    );

  }
}
