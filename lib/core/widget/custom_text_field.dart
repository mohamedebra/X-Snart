import 'package:country_code_picker/country_code_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants/dimensions.dart';
import '../constants/styles.dart';
import '../functions/code_picker_widget.dart';

class CustomTextField extends StatefulWidget {
  final String titleText;
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final Function? onSubmit;
  final bool isEnabled;
  final int maxLines;
  final Color? colorFill;
  final TextCapitalization capitalization;
  final String? prefixImage;
  final Color? prefixImagecolor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double prefixSize;
  final TextAlign textAlign;
  final bool isAmount;
  final bool isNumber;
  final bool showTitle;
  final bool showBorder;
  final Color? colorBorder;
  final Color? prefixIconColor;

  final double iconSize;
  final bool isPhone;
  final String? countryDialCode;
  final double? fontSize;
  final double? borderRadius;
  final Function(CountryCode countryCode)? onCountryChanged;
  final Function()? function;
  final bool? readOnly;
  final void Function()? onTap;

  const CustomTextField({
    super.key,
    this.titleText = 'Write something...',
    required this.hintText,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSubmit,
    this.onChanged,
    this.prefixImage,
    this.prefixIcon,
    this.suffixIcon,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.prefixSize = Dimensions.paddingSizeSmall,
    this.textAlign = TextAlign.start,
    this.isAmount = false,
    this.isNumber = false,
    this.showTitle = false,
    this.showBorder = true,
    this.iconSize = 18,
    this.isPhone = false,
    this.countryDialCode,
    this.onCountryChanged,
    this.colorFill,
    this.contentPadding,
    this.fontSize,
    this.borderRadius,
    this.function,
    this.onTap,
    this.readOnly,
    this.prefixImagecolor, this.colorBorder, this.prefixIconColor,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  String? errorMessage(String str) {
    if (widget.hintText == "serialNumberHint".tr) {
      return "serialNumberRequired".tr;
    } else if (widget.hintText == "passwordHint".tr) {
      return "passwordRequired".tr;
    } else if (widget.hintText == "repasswordHint".tr) {
      return "repasswordRequired".tr;
    }
    else if (widget.hintText == "name".tr) {
      return "nameRequired".tr;
    } else if (widget.hintText == "phone".tr) {
      return "phoneRequired".tr;
    } else if (widget.hintText == "address".tr) {
      return "addressRequired".tr;
    } else if (widget.hintText == "trade_name".tr) {
      return "commercial_registerRequired".tr;
    } else if (widget.hintText == "tax_number".tr) {
      return "Tax_registerRequired".tr;
    } else if (widget.hintText == "region".tr) {
      return "regionRequired".tr;
    } else if (widget.hintText == "current_user".tr) {
      return "Enter_name".tr;
    } else if (widget.hintText == "20-3-2023".tr) {
      return "Enter_date".tr;
    } else if (widget.hintText == "email".tr) {
      return "emailRequired".tr;
    } else if (widget.hintText == "title_message".tr) {
      return "title_messageRequired".tr;
    } else if (widget.hintText == "message".tr) {
      return "messageRequired".tr;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showTitle
            ? Text(widget.titleText,
                style:
                    robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall))
            : const SizedBox(),
        SizedBox(
            height: widget.showTitle ? Dimensions.paddingSizeExtraSmall : 0),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return errorMessage(widget.hintText);
            }

            if (widget.titleText == "password".tr && value.length < 6) {
              return "weakPassword".tr;
            }

            if (widget.hintText == "email".tr) {
              if (!GetUtils.isEmail(value)) {
                return "invalidEmail".tr;
              }
            }

            return null;
          },
          readOnly: widget.readOnly ?? false,
          onTap: widget.onTap,
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          textAlign: widget.textAlign,
          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
          textInputAction: widget.inputAction,
          keyboardType:
              widget.isAmount ? TextInputType.number : widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,

          obscureText: widget.isPassword ? _obscureText : false,

          inputFormatters: widget.inputType == TextInputType.phone
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ]
              : widget.isAmount
                  ? [FilteringTextInputFormatter.allow(RegExp(r'\d'))]
                  : widget.isNumber
                      ? [FilteringTextInputFormatter.allow(RegExp(r'\d'))]
                      : null,
          decoration: InputDecoration(
            contentPadding: widget.contentPadding,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? Dimensions.paddingSizeExtraLarge),
              borderSide: BorderSide(
                  style:
                      widget.showBorder ? BorderStyle.solid : BorderStyle.none,
                  width: 0.3,
                  color: widget.colorBorder ??  Theme.of(context).primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? Dimensions.paddingSizeExtraLarge),
              borderSide: BorderSide(
                  style:
                      widget.showBorder ? BorderStyle.solid : BorderStyle.none,
                  width: 1,
                  color: Theme.of(context).primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(Dimensions.paddingSizeExtraLarge),
              borderSide: BorderSide(
                  style:
                      widget.showBorder ? BorderStyle.solid : BorderStyle.none,
                  width: 0.3,
                  color: Theme.of(context).primaryColor),
            ),
            isDense: true,
            hintText: widget.hintText,
            fillColor: widget.colorFill ?? Theme.of(context).cardColor,
            hintStyle: robotoRegular.copyWith(
                fontSize: widget.fontSize ?? Dimensions.fontSizeLarge,
                color: Theme.of(context).hintColor),
            filled: true,
            prefixIcon: widget.isPhone
                ? SizedBox(
                    width: 95,
                    child: Row(children: [
                      Container(
                          width: 85,
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radiusSmall),
                              bottomLeft:
                                  Radius.circular(Dimensions.radiusSmall),
                            ),
                          ),
                          margin: const EdgeInsets.only(right: 0),
                          padding: const EdgeInsets.only(left: 5),
                          child: Center(
                            child: CodePickerWidget(
                              boxDecoration: BoxDecoration(
                                  color: Theme.of(context).cardColor),
                              flagWidth: 25,
                              padding: EdgeInsets.zero,
                              onChanged: widget.onCountryChanged,
                              initialSelection: widget.countryDialCode,
                              favorite: [widget.countryDialCode!],
                              textStyle: robotoRegular.copyWith(
                                fontSize: Dimensions.fontSizeDefault,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                            ),
                          )),
                      Container(
                        height: 20,
                        width: 2,
                        color: Theme.of(context).disabledColor,
                      )
                    ]),
                  )
                : widget.prefixImage != null && widget.prefixIcon == null
                    ? Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widget.prefixSize),
                        child: Image.asset(
                          widget.prefixImage!,
                          height: 20,
                          width: 20,
                          color: widget.prefixImagecolor,
                        ),
                      )
                    : widget.prefixImage == null && widget.prefixIcon != null
                        ? Icon(widget.prefixIcon, size: widget.iconSize         ,
              color: widget.prefixIconColor,
            )
                        : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).hintColor.withOpacity(0.3)),
                    onPressed: widget.function ?? _toggle,
                  )
                : (widget.suffixIcon != null)
                    ? Icon(widget.suffixIcon,
                        color: Theme.of(context).primaryColor)
                    : null,
          ),

          // onSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus)
          //     : widget.onSubmit != null ? widget.onSubmit!(text) : null,
          onChanged: widget.onChanged as void Function(String)?,
        ),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
