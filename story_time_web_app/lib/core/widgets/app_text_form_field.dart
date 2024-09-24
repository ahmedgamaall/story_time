import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_web_app/core/theming/colors.dart';
import 'package:stories_web_app/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final String labelText;
  final int? maxLines;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Color? mainColor;
  final Function(String)? onChanged;

  const AppTextFormField({
    super.key,
    this.maxLines,
    this.onChanged,
    this.mainColor,
    required this.labelText,
    this.isObscureText,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      onChanged: onChanged,
      cursorColor: mainColor ?? ColorsManager.darkBlue,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: mainColor ?? ColorsManager.darkBlue,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: mainColor ?? ColorsManager.darkBlue,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelStyle: TextStyles.font25DarkBlueBold,
        labelText: labelText,
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font25DarkBlueBold,
      validator: validator,
    );
  }
}
