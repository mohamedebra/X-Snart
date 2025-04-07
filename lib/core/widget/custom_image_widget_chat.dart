import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../constants/images.dart';

class CustomImageWidgetChat extends StatelessWidget {
  final String image;
  final double? height;
  final double topRight;
  final double topLeft;
  final double bottomLeft;
  final double bottomRight;
  final double? width;
  final BoxFit? fit;
  final String? imageUser;
  const CustomImageWidgetChat({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.imageUser = Images.placeholder,
    this.topRight = 25,
    this.topLeft = 25,
    this.bottomLeft = 25,
    this.bottomRight = 25,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(topRight),
        topLeft: Radius.circular(topLeft),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
      child: CachedNetworkImage(
        placeholder: (context, url) => Image.asset(imageUser ?? Images.placeholder,
            height: height, width: width, fit: BoxFit.cover),
        imageUrl: AppConstants.appBaseUrlImages + image,
        fit: fit ?? BoxFit.cover,
        height: height,
        width: width,
        errorWidget: (c, o, s) => Image.asset(imageUser ?? Images.placeholder,
            height: height, width: width, fit: BoxFit.cover),
      ),
    );
  }
}
