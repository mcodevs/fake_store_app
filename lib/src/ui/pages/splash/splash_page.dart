import 'package:fake_store_app/src/common/constants/app_illustrations.dart';
import 'package:fake_store_app/src/common/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      /// For delay
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            (value.getBool("is_logged") ?? false)
                ? AppRoutes.home
                : AppRoutes.register,
            (route) => false,
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(
                height: 250,
                width: 250,
              ),
              child: const Image(
                image: AssetImage(
                  AppIllustrations.splash,
                ),
              ),
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
