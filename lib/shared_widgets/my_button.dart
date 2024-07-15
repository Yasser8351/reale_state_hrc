import 'package:get/get.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:flutter/material.dart';

import '../utilits/app_theme.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final _ButtonType _buttonType;
  final bool busy;
  final bool iconIsImage;
  final bool disable;
  final double width;
  final double? height;
  final IconData? leadingIcon;
  final Color? color;
  final Color? textColor;
  const MyButton(
      {Key? key,
      required this.text,
      this.onTap,
      this.textColor,
      this.height,
      this.busy = false,
      this.iconIsImage = false,
      this.disable = false,
      this.width = double.maxFinite,
      this.leadingIcon,
      this.color})
      : _buttonType = _ButtonType.filled,
        super(key: key);
  const MyButton.outlined(
      {Key? key,
      required this.text,
      this.height,
      this.textColor,
      this.onTap,
      this.busy = false,
      this.disable = false,
      this.width = double.maxFinite,
      this.leadingIcon,
      this.color})
      : _buttonType = _ButtonType.outlined,
        iconIsImage = false,
        super(key: key);
  const MyButton.text({
    Key? key,
    required this.text,
    this.onTap,
    this.busy = false,
    this.height,
    this.disable = false,
    this.width = double.maxFinite,
    this.leadingIcon,
    this.color,
    this.textColor,
  })  : _buttonType = _ButtonType.text,
        iconIsImage = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: getButtonColor(context),
      animationDuration: const Duration(milliseconds: 500),
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: _buttonType == _ButtonType.outlined
              ? BorderSide(color: color ?? kcPrimary, width: 1.0)
              : BorderSide.none),
      child: SizedBox(
        width: width,
        height: height ?? Get.height * .08,
        child: InkWell(
          splashColor: _buttonType == _ButtonType.filled
              ? color?.withOpacity(0.5)
              : null,
          // highlightColor: kcPrimarySwatch[],
          splashFactory: InkRipple.splashFactory,
          onTap: disable || busy ? null : onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (leadingIcon != null && !busy)
                Icon(
                  leadingIcon,
                  color: getTextColor(context),
                ),
              if (leadingIcon != null && !busy) horizontalSpaceSmall,
              if (!busy)
                MyText.button(
                  text,
                  color: textColor ?? getTextColor(context),
                ),
              if (busy)
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(kcPrimary),
                    strokeWidth: 3.0,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Color getButtonColor(BuildContext context) => disable
      ? kcGreyLight
      : busy
          ? kcGreyLight
          : _buttonType == _ButtonType.filled
              ? color ?? kcPrimary
              : Colors.transparent;
  Color getTextColor(BuildContext context) => disable
      ? kcGreyDark
      : _buttonType == _ButtonType.filled
          ? Colors.white
          : color ?? Theme.of(context).primaryColorDark;
}

enum _ButtonType { filled, outlined, text }
