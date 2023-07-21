import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tasks/ui/pages/home_page.dart';
import 'services/theme_services.dart';
import 'ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeServices().theme,

        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: const HomePage() ,
    );
  }
}
