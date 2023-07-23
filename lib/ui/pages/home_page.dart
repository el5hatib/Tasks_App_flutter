import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tasks/services/theme_services.dart';
import 'package:my_tasks/ui/pages/add_task_page.dart';
import 'package:my_tasks/ui/size_config.dart';
import '../widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
            onPressed: () {
              ThemeServices().switchTheme();
            },
            icon: Icon(Icons.brightness_6)),
      ),
      body: Center(
          child: MyButton(label: 'Go To ', onTap: () {
            Get.to(AddTaskPage());
          },),
        ),
    );
  }
}
