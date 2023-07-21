import 'package:flutter/material.dart';
//import 'ui/pages/home_page.dart';
import 'package:get/get.dart';

import 'ui/pages/notification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: NotificationScreen(payload: "To DO APP  |Building To Do App using Dart and Flutter |5:09 pm",)

    );
  }
}
