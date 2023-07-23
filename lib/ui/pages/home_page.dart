import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_tasks/controllers/task_controller.dart';
import 'package:my_tasks/services/theme_services.dart';
import 'package:my_tasks/ui/pages/add_task_page.dart';
import 'package:my_tasks/ui/size_config.dart';
import 'package:my_tasks/ui/theme.dart';
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
      appBar: buildAppBar(),
      body: Column(
        children: [
          //_addDateBar(),
          _addTaskBar(),
          SizedBox(height: SizeConfig.screenHeight*0.02,),
          //_showTask(),

        ],
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
_addTaskBar(){
  return Container(
    margin: EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat.yMMMMd().format(DateTime.now()), style: Themes().subHeadingStyle,),
            Text(
              'Today',
              style: Themes().headingStyle,
            ),
          ],
        ),
        MyButton(
          label: '+ Add Task',
          onTap: () async{
           await Get.to(() => const AddTaskPage());
           final TaskController _taskController = Get.put(TaskController());
           _taskController.getTasks();
          },
        ),
      ],
    ),
  );
}
_addDateBar(){}
_showTask(){}
