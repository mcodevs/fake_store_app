import 'package:fake_store_app/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String? Function(String? value) validator;
  final IconData icon;
  final String hintText;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscure;
  late FocusNode focusNode;

  @override
  void initState() {
    isObscure = widget.isPassword;
    focusNode = FocusNode()..addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    focusNode
      ..removeListener(() => setState(() {}))
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: focusNode,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: focusNode.hasFocus ? AppColors.primary : AppColors.grey,
          ),
      obscureText: isObscure,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        prefixIconColor:
            focusNode.hasFocus ? AppColors.primary : AppColors.grey,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide(
            color: AppColors.primary,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.labelSmall,
        suffixIconColor:
            focusNode.hasFocus ? AppColors.primary : AppColors.grey,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () => setState(() => isObscure = !isObscure),
                icon: Icon(
                  isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              )
            : null,
      ),
      validator: widget.validator,
      textInputAction: TextInputAction.next,
    );
  }
}
