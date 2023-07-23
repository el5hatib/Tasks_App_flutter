import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_tasks/controllers/task_controller.dart';
import 'package:my_tasks/ui/theme.dart';
import 'package:my_tasks/ui/widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20, 25, 30];
  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly', 'Yearly'];
  int _selectedColor = 0;
  void _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    );
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print('It is null');
    }
  }
  void _getTimeFromUser({required bool isStartTime}) async {
    TimeOfDay? _pickerTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (_pickerTime != null) {
      setState(() {
        if (isStartTime) {
          _startTime = _pickerTime.format(context);
        } else {
          _endTime = _pickerTime.format(context);
        }
      });
    } else {
      print('It is null');
    }
  }
  /*void _addTask() {
    _taskController.addTask(
      title: _titleController.text,
      note: _noteController.text,
      date: _selectedDate,
      startTime: _startTime,
      endTime: _endTime,
      remind: _selectedRemind,
      repeat: _selectedRepeat,
      color: _selectedColor,
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Add Task', style: Themes().headingStyle),
              InputField(
                title: 'Title',
                hint: 'Enter title her',
                controller: _titleController,
              ),
              InputField(
                title: 'Note',
                hint: 'Enter note her',
                controller: _noteController,
              ),
              InputField(
                title: 'Date',
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  onPressed: () {
                    _getDateFromUser();
                  },
                  icon: Icon(Icons.calendar_today),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: 'Start Time',
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          //_getTimeFromUser(isStartTime: true);
                        },
                        icon: Icon(Icons.access_time),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InputField(
                      title: 'End Time',
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: Icon(Icons.access_time),
                      ),
                    ),
                  ),
                ],
              ),
              InputField(
                title: 'Remind',
                hint: '$_selectedRemind minutes early',
                widget: DropdownButton(
                  borderRadius: BorderRadius.circular(12),
                 dropdownColor: Colors.blueGrey,
                  value: _selectedRemind,
                  items: remindList.map((int item) {
                    return DropdownMenuItem<int>(
                      value: item,
                      child: Text(
                        '$item',
                        style: TextStyle(
                          color : Get.isDarkMode? Colors.white : darkGreyClr,
                        ),
                      ),
                    );
                  }).toList(),
                  underline: SizedBox(),
                  onChanged: (int? newValue) {
                    setState(() {
                      _selectedRemind = newValue!;
                    });
                  },
                ),
              ),
              InputField(
                title: 'Repeat',
                hint: _selectedRepeat,
                widget: DropdownButton(
                  dropdownColor: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12),
                  value: _selectedRepeat,
                  items: repeatList.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          color : Get.isDarkMode? Colors.white : darkGreyClr,
                        ),
                      ),
                    );
                  }).toList(),
                  underline: SizedBox(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRepeat = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
         Row (
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      chooseNoteColor(0),
                      SizedBox(
                        width: 16,
                      ),
                      chooseNoteColor(1),
                      SizedBox(
                        width: 16,
                      ),
                      chooseNoteColor(2),
                      SizedBox(
                        width: 16,
                      ),
                      chooseNoteColor(3),
                      SizedBox(
                        width: 16,
                      ),
                      chooseNoteColor(4),
                      SizedBox(
                        width: 16,
                      ),
                      chooseNoteColor(5),
                    ],
                  ),
                ],
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20 ),
                child: ElevatedButton(
                  onPressed: () {
                   /* _taskController.addTask(
                      title: _titleController.text,
                      note: _noteController.text,
                      date: _selectedDate,
                      startTime: _startTime,
                      endTime: _endTime,
                      remind: _selectedRemind,
                      repeat: _selectedRepeat,
                      color: _selectedColor,
                    );*/
                  },
                  child: Text('Creat Task'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Themes().colors[_selectedColor],
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }

  GestureDetector chooseNoteColor(int value) {
    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColor = value;
                        });
                      },
                      child: CircleAvatar(
                        child: _selectedColor == value
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : null,
                        backgroundColor: Themes().colors[value],
                        radius: 15,
                      ),
                    );
  }
}
