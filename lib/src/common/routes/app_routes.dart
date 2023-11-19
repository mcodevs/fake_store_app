import 'package:fake_store_app/src/ui/pages/auth/login/login_page.dart';
import 'package:fake_store_app/src/ui/pages/auth/register/register_page.dart';
import 'package:fake_store_app/src/ui/pages/home/home_page.dart';
import 'package:fake_store_app/src/ui/pages/settings/settings_page.dart';
import 'package:fake_store_app/src/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

abstract final class AppRoutes {
  static const splash = "/splash";
  static const home = "/home";
  static const register = "/register";
  static const login = "/login";
  static const settings = "/settings";

  static final Map<String, Widget Function(BuildContext context)> routes = {
    splash: (context) => const SplashPage(),
    home: (context) => const HomePage(),
    register: (context) => const RegisterPage(),
    login: (context) => const LoginPage(),
    settings: (context) => const SettingsPage(),
  };
}
