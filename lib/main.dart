import 'package:ecommerce/utilities/router.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:ecommerce/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //hide status bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      onGenerateRoute: onGenerateRoute,
      initialRoute: AppRoutes.bottomNavBarRoute,
    );
  }
}
