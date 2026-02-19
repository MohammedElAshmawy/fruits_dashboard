import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/text_Styles.dart';
import 'custom_checkbox.dart';

class FeaturedCheckBox extends StatefulWidget {
  const FeaturedCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<FeaturedCheckBox> createState() => _FeaturedCheckBoxState();
}

class _FeaturedCheckBoxState extends State<FeaturedCheckBox> {

  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          isChecked: isTermsAccepted,
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
        Spacer(),
        Expanded(
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Is Featured Item ?",
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.darkGreyColor
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}