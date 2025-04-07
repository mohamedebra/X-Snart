// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DefaultDropdown extends StatelessWidget {
  Object? value;
  Function(Object?)? onChanged;
  List<DropdownMenuItem<Object>>? items;
  String? Function(Object?)? validator;
  double? radius;
  double? fontSize;
  double? height;
  double? iconSize;
  double? width;
  Color colorBorder;
  Color? color;
  Color? fillColor;
  TextStyle? labelStyle;
  String? labelText;

  DefaultDropdown(
      {super.key,
      this.onChanged,
      this.items,
      required this.labelText,
      this.labelStyle,
      required this.validator,
      this.radius,
      this.height,
      this.fontSize,
      this.iconSize,
      this.width,
      required this.colorBorder,
      this.color,
      this.fillColor,
      this.value});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      iconSize: iconSize ?? 20,
      style: TextStyle(
          fontSize: fontSize ?? 14,
          color: Colors.black87,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        counterStyle: const TextStyle(
          fontSize: 13,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        hintText: labelText,
        hintStyle: TextStyle(
            color: color ?? Colors.black,
            fontSize: fontSize ?? 16,
            fontWeight: FontWeight.w800),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(
            radius ?? 15,
          ),
        ),
        fillColor: fillColor ?? Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius ?? 15,
          ),
          borderSide: BorderSide(color: colorBorder, width: 2),
        ),
        errorMaxLines: 1,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 15),
          borderSide: const BorderSide(width: 2.0, color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 15),
          borderSide: const BorderSide(width: 2.0, color: Colors.red),
        ),
      ),
      value: value,
      borderRadius: BorderRadius.circular(10),
      items: items,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
