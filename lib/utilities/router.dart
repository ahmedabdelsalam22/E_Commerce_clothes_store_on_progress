import 'package:ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';

import '../view/pages/landing_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.landingPageRoute:
    default:
      return MaterialPageRoute(builder: (_) => const LandingPage());
  }
}
