import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tasks/services/theme_services.dart';
import 'package:my_tasks/ui/pages/add_task_page.dart';
import 'package:my_tasks/ui/size_config.dart';
import 'package:my_tasks/ui/theme.dart';
import '../widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: MyButton(
          label: 'Go To ',
          onTap: () {
            Get.to(AddTaskPage());
          },
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            ThemeServices().switchTheme();
          },
          icon: Icon(
            Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: Get.isDarkMode ? Colors.amber : darkGreyClr,
          ),
        ),
      ],
      title: Text('My Tasks'),
      leading: Icon(
        Icons.list_alt_outlined,
        size: 24,
        color: Get.isDarkMode ? Colors.white : darkGreyClr,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
