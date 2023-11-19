import 'package:fake_store_app/src/common/routes/app_routes.dart';
import 'package:fake_store_app/src/common/themes/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fake Store App",
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.dark,
      builder: (context, child) => child!,
    );
  }
}
