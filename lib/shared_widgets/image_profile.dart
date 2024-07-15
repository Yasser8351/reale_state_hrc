import 'package:flutter/material.dart';
import 'package:real_estate/utilits/app_theme.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile(
      {Key? key, this.child, this.height, this.width, this.onTap})
      : super(key: key);
  final Widget? child;
  final double? height;
  final double? width;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kcGreyLight,
        ),
        child: child ?? null,
        height: height ?? 120,
        width: width ?? 120,
        clipBehavior: Clip.antiAlias,
      ),
    );
  }
}
