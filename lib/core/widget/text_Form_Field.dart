// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names, unnecessary_null_in_if_null_operators, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultFormField extends StatelessWidget {
  Color? textColor;
  int? MaxLength;
  int? maxLines;
  double? fontSize;
  double? radius;
  TextEditingController controller;
  TextInputType? keyboardType;
  String? label;
  Widget? prefixIcon;
  Color? colorBorder;
  Color? fillColor;
  IconData? suffixIcon;
  String? Function(String?) validate;
  TextAlign? textAlign;
  Function? suffixPressed;
  List<TextInputFormatter>? inputFormatters;
  String? hint;
  void Function(String)? onChanged;
  void Function(String?)? onSaved;
  bool? isPassword;

  void Function()? onTap;

  DefaultFormField({
    super.key,
    this.textColor,
    this.MaxLength,
    this.maxLines,
    this.fontSize,
    this.radius,
    required this.controller,
    this.keyboardType,
    this.label,
    this.prefixIcon,
    this.colorBorder,
    this.fillColor,
    this.suffixIcon,
    required this.validate,
    this.textAlign,
    this.suffixPressed,
    this.inputFormatters,
    this.hint,
    this.onChanged,
    this.onSaved,
    this.isPassword,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      inputFormatters: inputFormatters,
      onTap: onTap ?? null,
      obscureText: isPassword ?? false,
      textAlign: textAlign ?? TextAlign.start,
      maxLength: MaxLength ?? null,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontSize: (fontSize ?? 14).sp,
        fontWeight: FontWeight.w500,
      ),
      onChanged: onChanged,
      onSaved: onSaved,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validate,
      decoration: InputDecoration(
        hintText: hint,
        counterStyle: TextStyle(
          fontSize: 13.sp,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
        labelText: label,
        labelStyle: TextStyle(color: textColor, fontSize: 16.sp),
        prefixIcon: prefixIcon ?? null,
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(suffixIcon))
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(
            radius ?? 15,
          ).r,
        ),
        fillColor: fillColor ?? Colors.grey.withOpacity(0.2),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius ?? 15.r,
          ),
          borderSide: BorderSide(
            color: colorBorder ?? Colors.grey.withOpacity(0.2),
          ),
        ),
        errorMaxLines: 2,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 15.r),
          borderSide: const BorderSide(width: 2.0, color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 15.r),
          borderSide: const BorderSide(width: 2.0, color: Colors.red),
        ),
      ),
    );
  }
}
