import 'package:fake_store_app/src/ui/pages/auth/validators/text_form_validators.dart';
import 'package:fake_store_app/src/ui/pages/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterTextFields extends StatelessWidget {
  const RegisterTextFields({
    super.key,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController rePasswordController,
  })  : _nameController = nameController,
        _emailController = emailController,
        _passwordController = passwordController,
        _rePasswordController = rePasswordController;

  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _rePasswordController;

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
          controller: _emailController,
          validator: TextFormValidators.emailValidator,
          icon: Icons.email_outlined,
          hintText: "Email",
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: _passwordController,
          validator: TextFormValidators.passwordValidator,
          icon: Icons.lock_outline,
          hintText: "New password",
          isPassword: true,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: _rePasswordController,
          validator: (value) => TextFormValidators.rePasswordValidator(
            value,
            _passwordController.text,
          ),
          icon: Icons.lock_outline,
          hintText: "Confirm password",
          isPassword: true,
        ),
      ],
    );
  }
}
