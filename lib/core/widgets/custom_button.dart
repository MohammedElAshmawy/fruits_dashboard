
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_Styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.primaryColor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: TextStyles.bold16.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.whiteColor
        )),
      ),
    );
  }
}
