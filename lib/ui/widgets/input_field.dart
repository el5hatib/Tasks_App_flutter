import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tasks/ui/size_config.dart';

import '../theme.dart';

class InputField extends StatelessWidget {
  final String title;

  final String hint;

  final TextEditingController? controller;

  final Widget widget;

  const InputField({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Container(
        width: SizeConfig.screenWidth,
        height: 52,
        padding: EdgeInsets.only(
          top: 10,
        ),
        margin: EdgeInsets.only(
          left: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Row(
          children: [
            Expanded(child: TextFormField(
              controller: controller,
              autofocus: false,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: Themes().subTitleStyle,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
            ),
              cursorColor: Get.isDarkMode ? Colors.white : darkGreyClr,
              readOnly:  false ,
              style: Themes().subTitleStyle,

            ),
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
