import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/view/pages/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/database_controller.dart';
import 'bottom_nav.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);

    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return const LoginPage();
          }
          return ChangeNotifierProvider<AuthController>(
            create: (_) => AuthController(authBase: auth),
            child: Provider<Database>(
              create: (_) => FirestoreDatabase(user.uid),
              child: BottomNavBar(),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
