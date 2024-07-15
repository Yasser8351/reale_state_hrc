import 'dart:io';

import 'package:flutter/material.dart';
import 'package:real_estate/shared_widgets/image_app.dart';
import 'package:real_estate/shared_widgets/image_profile.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

class ImageWithEditIcon extends StatelessWidget {
  const ImageWithEditIcon(
      {super.key, required this.image, this.onTap, this.imageFile, this.child});
  final String image;
  final File? imageFile;
  final Widget? child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: ImageProfile(
            child: imageFile == null
                ? Image.asset(
                    image,
                    fit: BoxFit.contain,
                  )
                : Image.file(
                    imageFile!,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        child ??
            Positioned(
              top: px90,
              left: px90,
              child: Container(
                width: px25,
                height: px25,
                child: ImageApp(
                  image: AppImage.edit,
                ),
              ),
            ),
      ],
    );
  }
}
