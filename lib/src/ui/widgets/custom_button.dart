import 'package:fake_store_app/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading,
  });

  final VoidCallback onPressed;
  final String text;
  final ValueNotifier<bool>? isLoading;

  static const _size = Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: _size,
        minimumSize: _size,
        maximumSize: _size,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.light,
      ),
      child: ValueListenableBuilder<bool>(
        valueListenable: isLoading != null ? isLoading! : ValueNotifier(false),
        builder: (context, value, child) {
          if (value) {
            return const SizedBox.square(
              dimension: 25,
              child: CircularProgressIndicator(
                color: AppColors.light,
              ),
            );
          } else {
            return Text(text);
          }
        },
      ),
    );
  }
}
