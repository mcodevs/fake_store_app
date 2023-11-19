import 'package:fake_store_app/src/common/constants/api_const.dart';
import 'package:fake_store_app/src/common/routes/app_routes.dart';
import 'package:fake_store_app/src/common/services/api_helper/api_helper.dart';
import 'package:fake_store_app/src/common/services/api_services/auth_service_api.dart';
import 'package:fake_store_app/src/common/utils/exceptions/exception.dart';
import 'package:fake_store_app/src/ui/pages/auth/login/widgets/login_text_fields.dart';
import 'package:fake_store_app/src/ui/pages/auth/widgets/bottom_banner.dart';
import 'package:fake_store_app/src/ui/pages/auth/widgets/top_banner.dart';
import 'package:fake_store_app/src/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late final ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  void initState() {
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void goToRegister() =>
      Navigator.pushReplacementNamed(context, AppRoutes.register);

  Future<void> goToHome() async {
    if (_key.currentState?.validate() ?? false) {
      try {
        isLoading.value = true;
        final user =
            await AuthServiceAPI(ApiHelper(baseUrl: ApiConst.baseUrl)).login(
          username: _nameController.text,
          password: _passwordController.text,
        );
        isLoading.value = false;
        print(user.toString());
        if (!context.mounted) return;
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.home,
          (route) => false,
        );
      } on FakeApiException catch (e) {
        if (!context.mounted) return;
        isLoading.value = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
            duration: const Duration(seconds: 3),
            showCloseIcon: true,
          ),
        );
      }
    }
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
                        title: "Welcome to OnlineStore",
                        subtitle: "Sign in to continue",
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: LoginTextFields(
                        nameController: _nameController,
                        passwordController: _passwordController,
                      ),
                    ),
                    CustomButton(
                      onPressed: goToHome,
                      text: "Login",
                      isLoading: isLoading,
                    ),
                    const SizedBox(height: 30),
                    BottomBanner(
                      bottomText: "Don’t have a account?",
                      linkText: "Register",
                      onTap: goToRegister,
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
