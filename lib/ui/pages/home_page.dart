import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tasks/services/theme_services.dart';

import '../widgets/button.dart';
import 'notification_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
            Get.to(NotificationScreen(payload: "ToDO | Flutter App | 6 : 33 pm "));
          },),
        ),
    );
  }
}
