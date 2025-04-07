// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/dimensions.dart';
import '../constants/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButton;
  final bool? titleCentre;
  final bool isActions;
  final IconData? iconActions;
  final Function? onBackPressed;
  final Function? onActions;
  final bool showCart;
  final Function(String value)? onVegFilterTap;
  final String? type;
  final String? leadingIcon;
  final String? actionsIcon;
  final double? elevation;
  final Color? colorIcon;
  final Color? colorTitle;
  final Color? backgroundColor;
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.backButton = true,
      this.isActions = true,
      this.onBackPressed,
      this.showCart = false,
      this.leadingIcon,
      this.onVegFilterTap,
      this.type,
      this.colorTitle,
      this.colorIcon,
      this.titleCentre,
      this.backgroundColor,
      this.actionsIcon,
      this.elevation,
      this.iconActions,
        this.onActions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      title: Text(title,
          style: robotoMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraLarge,
              color:
                  colorTitle ?? Theme.of(context).textTheme.bodyLarge!.color)),
      centerTitle: titleCentre ?? true,
      leading: backButton
          ? IconButton(
              icon: leadingIcon != null
                  ? Image.asset(
                      leadingIcon!,
                      height: 22,
                      width: 22,
                      color: colorIcon,
                    )
                  : const Icon(Icons.arrow_back),
              color: Theme.of(context).textTheme.bodyLarge!.color,
              onPressed: () => onBackPressed != null
                  ? onBackPressed!()
                  : Navigator.pop(context),
            )
          : const SizedBox(),
      backgroundColor: backgroundColor ?? Theme.of(context).cardColor,
      elevation: elevation ?? 0,
      actions: isActions
          ? [
              isActions
                  ? IconButton(
                      icon: actionsIcon != null
                          ? Image.asset(
                              actionsIcon!,
                              height: 22,
                              width: 22,
                              color: colorIcon,
                            )
                          : Icon(iconActions ?? Icons.arrow_back),
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      onPressed: () => onActions != null
                          ? onActions!()
                          : Navigator.pop(context),
                    )
                  : const SizedBox(),
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => Size(Get.width, GetPlatform.isDesktop ? 100 : 50);
}
