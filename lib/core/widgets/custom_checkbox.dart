import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key, required this.isChecked,
    required this.onChecked
  });

  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
          decoration: ShapeDecoration(
            color: isChecked? AppColors.primaryColor:AppColors.transperentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                  color: isChecked? AppColors.primaryColor: AppColors.borderContainerColor
                )
              )
          ),
          duration: Duration(milliseconds: 300),
          child:isChecked? Icon(Icons.check):SizedBox(),
      ),
    );
  }
}