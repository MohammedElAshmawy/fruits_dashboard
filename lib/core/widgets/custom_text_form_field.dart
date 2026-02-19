import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/text_Styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.textEditingController,
    this.maxLines,
  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;
  final void Function(String?)? onSaved;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUnfocus,
      maxLines: maxLines ?? 1,
      onSaved: onSaved,
      validator: (value) {
        if (value!.isEmpty) {
          return "this field is required ";
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        helperStyle: TextStyles.bold13.copyWith(
          color: AppColors.hintTextFormFieldColor,
          fontWeight: FontWeight.w700,
        ),
        filled: true,
        fillColor: AppColors.fillFormFieldColor,
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        alignLabelWithHint: true,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(width: 1, color: AppColors.borderColor),
    );
  }
}