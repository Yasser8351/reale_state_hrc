import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/model/project_model.dart';
import 'package:real_estate/shared_widgets/container_with_decoration.dart';
import 'package:real_estate/shared_widgets/image_app.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget(
      {Key? key,
      required this.list,
      this.textStyleColor,
      required this.onChangedValueSelected,
      required this.valueDrowpDownSelected,
      this.title,
      this.backgroundColor,
      this.height,
      this.paddingHadding,
      this.icon,
      required this.hint})
      : super(key: key);
  final List<dynamic> list;
  final Function(String value) onChangedValueSelected;
  final String? title;
  final String? valueDrowpDownSelected;
  final String hint;
  final Color? textStyleColor;
  final Color? backgroundColor;
  final double? paddingHadding;
  final double? height;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHadding ?? 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
              alignment: AlignmentDirectional.bottomStart,
              child: MyText.h6(title ?? "")),
          verticalSpaceRegular,
          ContainerWithDecoration(
            height: height ?? Get.width * .16,
            bottomRight: px10,
            bottomLeft: px10,
            topRight: px10,
            topLeft: px10,
            paddingRight: px10,
            paddinLeft: px10,
            color: backgroundColor ?? kcPrimarySwatch[100],
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text(
                  hint,
                  style: TextStyle(color: textStyleColor ?? Colors.grey[350]),
                ),
                onChanged: (value) {
                  onChangedValueSelected(value ?? "");
                },
                style: TextStyle(color: textStyleColor ?? kcAccent),
                value: valueDrowpDownSelected,
                isExpanded: true,
                iconSize: 28,
                icon: icon ?? ImageApp(image: AppImage.arrow_down),
                items: list
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item.id.toString(),
                        child: Text(
                          item.nameEN,
                          style: TextStyle(color: kcAccent),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownWidget2 extends StatelessWidget {
  const DropdownWidget2(
      {Key? key,
      required this.list,
      this.textStyleColor,
      required this.onChangedValueSelected,
      required this.valueDrowpDownSelected,
      this.title,
      this.paddingHadding,
      this.icon,
      required this.hint})
      : super(key: key);
  final List<ProjectDtos> list;
  final Function(String value) onChangedValueSelected;
  final String? title;
  final String? valueDrowpDownSelected;
  final String hint;
  final Color? textStyleColor;
  final double? paddingHadding;

  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHadding ?? 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
              alignment: AlignmentDirectional.bottomStart,
              child: MyText.h6(title ?? "")),
          verticalSpaceRegular,
          ContainerWithDecoration(
            height: Get.width * .16,
            bottomRight: px10,
            bottomLeft: px10,
            topRight: px10,
            topLeft: px10,
            paddingRight: px10,
            paddinLeft: px10,
            color: kcPrimarySwatch[100],
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text(
                  hint,
                  style: TextStyle(color: textStyleColor ?? Colors.grey[350]),
                ),
                onChanged: (value) {
                  onChangedValueSelected(value ?? "");
                },
                style: TextStyle(color: textStyleColor ?? kcAccent),
                value: valueDrowpDownSelected,
                isExpanded: true,
                iconSize: 28,
                icon: icon ?? ImageApp(image: AppImage.arrow_down),
                items: list
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item.project.id.toString(),
                        child: Text(
                          item.project.nameEN,
                          style: TextStyle(color: kcAccent),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
