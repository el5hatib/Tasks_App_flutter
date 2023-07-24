import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
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
  _addDateBar(){
    return Container(
        margin: EdgeInsets.all(10),
        child: DatePicker(
            DateTime.now(),
            width: 60,
            height: 80,
            initialSelectedDate: DateTime.now(),
            selectionColor: Themes().colors[0],
            selectedTextColor: Colors.white,
            dateTextStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color:  Colors.grey,
              ),
            ),
            dayTextStyle:GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color:  Colors.grey,
              ),
            ),
            monthTextStyle:GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            onDateChange: (newDate) {
              // New date selected
              setState(() {
                 _selectedValue = newDate;
              });
            })
    );}
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
_showTask(){}
}



