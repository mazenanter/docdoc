import 'package:docdoc/core/theming/colors_manager.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.focusedBorder,
      this.enabledBorder,
      this.hintStyle,
      this.inputTextStyle,
      required this.hintText,
      this.contentPadding,
      this.obsucreText,
      this.suffixIcon,
      this.backgroundColor,
      this.controller,
      required this.validator});
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final bool? obsucreText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: ColorsManager.primaryColor,
                width: 1.3,
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: ColorsManager.ligtherGray,
                width: 1.3,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        hintStyle: hintStyle ?? Styles.font14LightGrayRegular,
        suffixIcon: suffixIcon,
        hintText: hintText,
        fillColor: backgroundColor ?? ColorsManager.darkWhite,
        filled: true,
      ),
      style: inputTextStyle ?? Styles.font14DarkBlueMeduim,
      obscureText: obsucreText ?? false,
    );
  }
}
