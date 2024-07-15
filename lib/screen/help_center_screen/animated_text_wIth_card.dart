import 'package:flutter/material.dart';
import 'package:real_estate/shared_widgets/image_app.dart';
import 'package:real_estate/shared_widgets/my_text.dart';
import 'package:real_estate/utilits/app_image.dart';
import 'package:real_estate/utilits/app_ui_helpers.dart';

class AnimatedTextWIthCard extends StatelessWidget {
  const AnimatedTextWIthCard({
    Key? key,
    required this.title,
    required this.discreption,
    required this.expand,
    required this.onTap,
  }) : super(key: key);
  final title;
  final discreption;
  final bool expand;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: px20),
      shape: const RoundedRectangleBorder(
          side: const BorderSide(
              color: Color.fromARGB(255, 31, 30, 30), width: 0.05),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          ListTile(
            leading: Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            trailing: InkWell(
              onTap: onTap,
              // child: Icon(
              //   expand ? Icons.expand_less : Icons.expand_more,
              //   color: kcPrimary,
              // ),
              child: ImageApp(
                // width: px20,
                image: expand ? AppImage.arrow_down : AppImage.arrow_down,
                // color: kcPrimary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: px20),
            child: Divider(height: 0),
          ),
          verticalSpaceRegular,
          expand
              ? SizedBox()
              : AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Container(
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: expand
                          ? const SizedBox()
                          : MyText.h6(
                              discreption,
                              maxLines: 10,
                            ),
                    ),
                  ),
                ),
          expand ? SizedBox() : verticalSpaceMedium,
        ],
      ),
    );
  }
}
