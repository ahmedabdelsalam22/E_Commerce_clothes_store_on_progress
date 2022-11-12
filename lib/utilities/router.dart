import 'package:ecommerce/utilities/routes.dart';
import 'package:ecommerce/view/pages/login_page.dart';
import 'package:ecommerce/view/pages/register_page.dart';
import 'package:flutter/material.dart';

import '../view/pages/landing_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return MaterialPageRoute(builder: (_) => const LoginPage());

    case AppRoutes.registerPageRoute:
      return MaterialPageRoute(builder: (_) => const RegisterPage());

    case AppRoutes.landingPageRoute:
    default:
      return MaterialPageRoute(builder: (_) => const LandingPage());
  }
}
