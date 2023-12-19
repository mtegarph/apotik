import 'package:apotik/features/dashboard/presentation/pages/home_page.dart';
import 'package:apotik/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const LoginPage());

      case '/home':
        return _materialRoute(const HomePage());

      default:
        return _materialRoute(const LoginPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
