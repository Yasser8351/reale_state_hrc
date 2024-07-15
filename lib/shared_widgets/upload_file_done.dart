import 'package:flutter/cupertino.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_theme.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

class UploadFileDone extends StatelessWidget {
  const UploadFileDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText.h6("تم رفع الملف"),
        horizontalSpaceLargTiny,
        Icon(CupertinoIcons.check_mark_circled_solid,
            color: kcPrimary, size: px32),
      ],
    );
  }
}
