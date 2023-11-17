import 'package:fake_store_app/src/common/routes/app_routes.dart';
import 'package:fake_store_app/src/common/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SuccessApp extends StatelessWidget {
  const SuccessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fake Store App",
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.register,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
    );
  }
}
