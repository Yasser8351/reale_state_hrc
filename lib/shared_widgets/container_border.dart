import 'package:flutter/material.dart';
import 'package:real_estate/utilits/app_theme.dart';

class ContainerBorder extends StatelessWidget {
  ContainerBorder(
      {Key? key,
      required this.child,
      this.color = kcPrimary,
      this.onTap = null,
      this.border = null,
      this.isLoading = false,
      this.height = 30,
      this.radius = 12,
      this.width = 200})
      : super(key: key);

  final Widget child;
  final Color color;
  final double height;
  final double width;
  final double radius;
  final BoxBorder? border;
  final Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Center(child: isLoading ? CircularProgressIndicator() : child),
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            color: isLoading ? kcGreyLight : color,
            border: border),
      ),
    );
  }
}
