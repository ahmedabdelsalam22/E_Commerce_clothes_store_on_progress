import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:ecommerce/view/pages/auth/login_page.dart';
import 'package:ecommerce/view/pages/bottom_nav.dart';
import 'package:flutter/material.dart';

import '../view/pages/auth/register_page.dart';
import '../view/pages/landing_page.dart';
import '../view/pages/product_details.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.productDetailsPageRoute:
      final product = settings.arguments as Product;
      return MaterialPageRoute(
          builder: (_) => ProductDetailsPage(
                product: product,
              ),
          settings: settings);

    case AppRoutes.loginPageRoute:
      return MaterialPageRoute(
          builder: (_) => const LoginPage(), settings: settings);

    case AppRoutes.registerPageRoute:
      return MaterialPageRoute(
          builder: (_) => const RegisterPage(), settings: settings);

    case AppRoutes.bottomNavBarRoute:
      return MaterialPageRoute(
          builder: (_) => BottomNavBar(), settings: settings);

    case AppRoutes.landingPageRoute:
    default:
      return MaterialPageRoute(
          builder: (_) => const LandingPage(), settings: settings);
  }
}
