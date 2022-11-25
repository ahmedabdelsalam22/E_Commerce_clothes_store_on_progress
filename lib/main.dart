import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/utilities/router.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:ecommerce/utilities/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> onBackgroundMessageHandler(RemoteMessage message) async {
  debugPrint(message.data.toString());
}

void main() async {
  //hide status bar

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  //firebase messaging
  String? token = await FirebaseMessaging.instance.getToken();
  debugPrint(token);
  // when app is opened when get notification
  FirebaseMessaging.onMessage.listen((event) {
    debugPrint(event.data.toString());
  });
  // when app is in foreground and click on notification when get notification
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    debugPrint(event.data.toString());
  });
  // when app is in closed when get notification
  FirebaseMessaging.onBackgroundMessage(onBackgroundMessageHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) => Auth(),
      child: MaterialApp(
        title: 'Ecommerce',
        debugShowCheckedModeBanner: false,
        theme: lightTheme(context),
        onGenerateRoute: onGenerateRoute,
        initialRoute: AppRoutes.landingPageRoute,
      ),
    );
  }
}
