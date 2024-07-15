import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFaildInput extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final VoidCallback? onSubmit;
  final String? hint;
  final String? label;
  final Color? labelColor;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextDirection? textDirection;
  final bool password;
  final int? maxLength;
  final int? maxLines;
  final InputBorder _outlinedBorder;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String? leadingText;
  final String? trailingText;
  final FormFieldValidator? validationMessages;
  final double padingAll;
  final double? padingLeft;
  final double? padingRigth;
  final double? padingTop;
  final double? padingBottom;
  final double labelPaddingStart;
  final double labelPaddingTop;
  final double labelPaddingBottom;
  final double labelPaddingEnd;
  final bool enableInteractiveSelection;
  final bool showHintStyle;
  final TextStyle? hintStyle;

  const TextFaildInput(
      {Key? key,
      required this.controller,
      this.validationMessages,
      this.hint,
      this.label,
      this.labelColor,
      this.onTap,
      this.inputFormatters,
      this.password = false,
      this.showHintStyle = false,
      this.padingAll = 0.0,
      this.onSubmit,
      this.inputType,
      this.inputAction = TextInputAction.done,
      this.textDirection,
      this.leadingIcon,
      this.trailingIcon,
      this.leadingText,
      this.trailingText,
      this.maxLength,
      this.maxLines,
      this.labelPaddingStart = 0.0,
      this.labelPaddingTop = 0.0,
      this.labelPaddingBottom = 0.0,
      this.labelPaddingEnd = 0.0,
      this.enableInteractiveSelection = true,
      this.padingLeft,
      this.fillColor,
      this.padingRigth,
      this.padingTop,
      this.hintStyle,
      this.padingBottom})
      : _outlinedBorder = const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Padding(
              padding: EdgeInsetsDirectional.only(
                  start: labelPaddingStart,
                  end: labelPaddingEnd,
                  bottom: labelPaddingBottom,
                  top: labelPaddingTop),
              child: MyText.h6(
                label ?? 'No Label',
                fontSize: 17,
                fontWeight: FontWeight.normal,
              )),
        if (label != null) verticalSpaceTiny,
        Padding(
          padding: padingAll == 0.0
              ? EdgeInsets.only(
                  bottom: padingBottom ?? 0,
                  left: padingLeft ?? 0,
                  right: padingRigth ?? 0,
                  top: padingTop ?? 0)
              : EdgeInsets.all(padingAll),
          child: TextFormField(
            // border
            controller: controller,
            autocorrect: false,
            // onTap: onTap,
            onChanged: (value) => {},
            cursorColor: kcPrimary,
            cursorRadius: const Radius.circular(2.0),
            inputFormatters: inputFormatters,
            obscureText: password,
            // onEditingComplete: onSubmit,
            onFieldSubmitted: null,
            keyboardType: inputType,
            textInputAction: inputAction,
            maxLength: maxLength,
            maxLines: maxLines ?? 1,
            style: Theme.of(context).textTheme.bodyLarge,
            textDirection: textDirection,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            validator: validationMessages,
            enableInteractiveSelection: enableInteractiveSelection == false
                ? enableInteractiveSelection
                : !password,
            // textAlign: ,
            decoration: InputDecoration(
              helperStyle: Theme.of(context).textTheme.labelSmall,
              prefixIcon: leadingIcon,
              prefixText: leadingText,
              suffixIcon: trailingIcon,
              suffixText: trailingText,
              hintText: hint,
              hintMaxLines: 1,
              hintStyle: showHintStyle
                  ? hintStyle
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey[350]),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              filled: true,
              fillColor: fillColor ?? kcPrimarySwatch[100],
              border: _outlinedBorder.copyWith(
                borderSide: BorderSide(width: 1.0, color: Colors.grey[300]!),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              errorBorder: _outlinedBorder.copyWith(
                borderSide: const BorderSide(color: Colors.red, width: 1.0),
              ),
              enabledBorder: _outlinedBorder.copyWith(
                borderSide: BorderSide(width: 0.0, color: Colors.grey[300]!),
              ),
              focusedBorder: _outlinedBorder.copyWith(
                borderSide: const BorderSide(color: kcPrimaryLight),
              ),
              counterStyle: Theme.of(context).textTheme.bodySmall,
              errorStyle: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
