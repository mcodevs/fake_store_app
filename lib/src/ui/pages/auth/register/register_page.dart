import 'package:fake_store_app/src/common/routes/app_routes.dart';
import 'package:fake_store_app/src/ui/pages/auth/register/widgets/register_text_fields.dart';
import 'package:fake_store_app/src/ui/pages/auth/widgets/bottom_banner.dart';
import 'package:fake_store_app/src/ui/pages/auth/widgets/top_banner.dart';
import 'package:fake_store_app/src/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _rePasswordController;
  late final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void goToHome() {
    if (_key.currentState?.validate() ?? false) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false,
      );
    }
  }

  void goToLogin() => Navigator.pushReplacementNamed(context, AppRoutes.login);

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: TopBanner(
                        title: "Let’s Get Started",
                        subtitle: "Create an new account",
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: RegisterTextFields(
                        nameController: _nameController,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        rePasswordController: _rePasswordController,
                      ),
                    ),
                    CustomButton(
                      onPressed: goToHome,
                      text: "Register",
                    ),
                    const SizedBox(height: 30),
                    BottomBanner(
                      bottomText: "Already have an account?",
                      linkText: "Login",
                      onTap: goToLogin,
                    ),
                    const SizedBox(height: 24)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
