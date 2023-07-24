import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          SizedBox(
            height: SizeConfig.screenHeight * 0.02,
          ),
          _showTask(),
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
            !Get.isDarkMode;
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

  _addTaskBar() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: Themes().subHeadingStyle,
              ),
              Text(
                'Today',
                style: Themes().headingStyle,
              ),
            ],
          ),
          MyButton(
            label: '+ Add Task',
            onTap: () async {
              await Get.to(() => const AddTaskPage());
              _taskController.getTasks();
            },
          ),
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
        margin: EdgeInsets.all(10),
        child: DatePicker(DateTime.now(),
            width: 60,
            height: 80,
            initialSelectedDate: DateTime.now(),
            selectionColor: Themes().colors[0],
            selectedTextColor: Colors.white,
            dateTextStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            dayTextStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            monthTextStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ), onDateChange: (newDate) {
          // New date selected
          setState(() {
            _selectedValue = newDate;
          });
        }));
  }

  _showTask() {
    return Expanded(
      child: Obx(
        () {
          final TaskController _taskController = Get.find();
          if (_taskController.taskList.isEmpty) {
            return _noTaskMsg();
          } else {
            return ListView.separated(
              padding: EdgeInsets.all(15),
              itemCount: _taskController.taskList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? darkGreyClr : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Get.isDarkMode
                            ? Colors.transparent
                            : Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _taskController.taskList[index].title,
                        style: Themes().titleStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _taskController.taskList[index].description,
                        style: Themes().subTitleStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _taskController.taskList[index].date,
                            style: Themes().bodyStyle,
                          ),
                          GestureDetector(
                            onTap: () {
                              _taskController.deleteTask(
                                  _taskController.taskList[index].id!);
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 15,
                );
              },
            );
          }
        },
      ),
    );
  }

  _noTaskMsg() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              children: [
                SizeConfig.orientation == Orientation.portrait
                    ? SizedBox(
                        height: SizeConfig.screenHeight * 0.4,
                      )
                    : SizedBox(
                        height: SizeConfig.screenHeight * 0.3,
                      ),
                SvgPicture.asset(
                  'images/task.svg',
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.2,
                  color: primaryClr.withOpacity(0.5),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? darkGreyClr : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Get.isDarkMode
                            ? Colors.transparent
                            : Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No Task',
                        style: Themes().titleStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'You have no task for today',
                        style: Themes().subTitleStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat.yMMMMd().format(DateTime.now()),
                            style: Themes().bodyStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
