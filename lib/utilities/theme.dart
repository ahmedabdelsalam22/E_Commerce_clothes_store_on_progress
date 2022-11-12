import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';

ThemeData lightTheme(context) => ThemeData(
      fontFamily: 'pro',
      primaryColor: ColorManager.primary,
      primarySwatch: Colors.red,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: ColorManager.backGround,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.backGround,
            statusBarBrightness: Brightness.dark),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: Theme.of(context).textTheme.subtitle1,
      ),
    );
