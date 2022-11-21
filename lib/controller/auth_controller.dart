import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';

import '../view/widgets/show_toast.dart';

class AuthController with ChangeNotifier {
  final AuthBase authBase;
  final BuildContext context;

  AuthController(
    this.context, {
    required this.authBase,
  });

  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
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
      {required String email, required String password}) async {
    try {
      await authBase.signUpWithEmailAndPassword(
          email: email, password: password);
      Navigator.pushReplacementNamed(context, AppRoutes.bottomNavBarRoute);
    } catch (e) {
      debugPrint(e.toString());
      showToast(message: e.toString(), color: Colors.red);
    }
  }
}
