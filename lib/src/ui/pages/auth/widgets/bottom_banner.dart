import 'package:fake_store_app/src/common/constants/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomBanner extends StatelessWidget {
  const BottomBanner({
    super.key,
    required this.bottomText,
    required this.linkText,
    required this.onTap,
  });

  final String bottomText;
  final String linkText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "$bottomText\n",
        style: Theme.of(context).textTheme.bodySmall,
        children: [
          TextSpan(
            text: "$linkText.",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.primary,
                ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
