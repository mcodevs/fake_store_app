import 'package:fake_store_app/src/ui/pages/auth/validators/text_form_validators.dart';
import 'package:fake_store_app/src/ui/pages/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({
    super.key,
    required TextEditingController nameController,
    required TextEditingController passwordController,
  })  : _nameController = nameController,
        _passwordController = passwordController;

  final TextEditingController _nameController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          controller: _nameController,
          validator: TextFormValidators.usernameValidator,
          icon: Icons.person_outline,
          hintText: "Username",
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: _passwordController,
          validator: TextFormValidators.passwordValidator,
          icon: Icons.lock_outline,
          hintText: "Password",
          isPassword: true,
        ),
      ],
    );
  }
}
