import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData lightTheme(context) => ThemeData(
      fontFamily: 'pro',
      backgroundColor: ColorManager.backGround,
      primaryColor: ColorManager.primary,
      primarySwatch: Colors.red,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: ColorManager.backGround,
        /*   systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.backGround,
            statusBarIconBrightness: Brightness.dark),*/
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: Theme.of(context).textTheme.subtitle1,
      ),
    );
