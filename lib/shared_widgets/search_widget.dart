import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/utilits/app_config.dart';
import 'package:real_estate/utilits/app_theme.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.onTap,
    this.width,
    this.onTapFilter,
    this.filterSearch,
    required this.controller,
    this.clearSearch,
    this.showCustomSuffixIcon = false,
    this.paddingHorizontal,
    this.height,
    this.suffixIcon,
    this.hintText,
  }) : super(key: key);
  final Function() onTap;
  final double? height;
  final double? width;
  final double? paddingHorizontal;
  final Function()? filterSearch;
  final Function()? clearSearch;
  final Function(int index)? onTapFilter;
  final TextEditingController controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool showCustomSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal ?? Get.height * .03),
      child: Container(
        decoration: BoxDecoration(
          color: kcPrimarySwatch[200],
          borderRadius: BorderRadius.circular(10),
        ),
        height: height ?? Get.height * .09, // 70 px
        width: width ?? Get.width * .79,
        child: TextField(
          controller: controller,
          onSubmitted: (String v) {
            onTap();
          },
          onChanged: (value) {
            // onTap();
          },
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            focusColor: kcPrimary,
            suffixIcon: showCustomSuffixIcon
                ? suffixIcon
                : controller.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.close, color: kcAccent),
                        onPressed: clearSearch)
                    : SizedBox(),
            prefixIcon: InkWell(
                onTap: onTap, child: Icon(Icons.search, color: kcAccent)),
            hintText: hintText ?? AppConfig.search.tr,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
