import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../view/widgets/show_toast.dart';
import 'database_controller.dart';

class AuthController with ChangeNotifier {
  final AuthBase authBase;

// TODO/ we will refactor it and apply dependency injection
  final database = FirestoreDatabase('123');

  AuthController({
    required this.authBase,
  });

  Future<void> loginWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await authBase.loginWithEmailAndPassword(
          email: email, password: password);
      Navigator.pushReplacementNamed(context, AppRoutes.bottomNavBarRoute);
    } catch (e) {
      debugPrint(e.toString());
      showToast(message: e.toString(), color: Colors.red);
    }
  }

  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    try {
      await authBase.signUpWithEmailAndPassword(
          email: email, password: password);
      database.setUserData(
        UserDataModel(uid: authBase.currentUser!.uid, email: email, name: name),
      );
      Navigator.pushReplacementNamed(context, AppRoutes.bottomNavBarRoute);
    } catch (e) {
      debugPrint(e.toString());
      showToast(message: e.toString(), color: Colors.red);
    }
  }

  Future<void> logOut() async {
    await authBase.logOut();
  }
}
