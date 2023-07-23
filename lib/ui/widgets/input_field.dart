import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tasks/ui/size_config.dart';

import '../theme.dart';

class InputField extends StatelessWidget {
  final String title;

  final String hint;

  final TextEditingController? controller;

  final Widget? widget;

  const InputField({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
     this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
           padding: const EdgeInsets.only(left:10.0),
           child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: Themes().titleStyle,
                )),
         ),
        Container(
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
                    prefix : Padding(padding: EdgeInsets.only(left:10.0)),
                    hintText: hint,
                    hintStyle: Themes().subTitleStyle,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                ),
                  cursorColor: Get.isDarkMode ? Colors.white : darkGreyClr,
                  readOnly:  widget == null ? false : true,
                  style: Themes().subTitleStyle,

                ),
                ),
                widget??Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
