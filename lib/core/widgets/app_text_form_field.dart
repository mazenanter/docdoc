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
      this.backgroundColor});
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final bool? obsucreText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
