import 'package:get/get.dart';

class TaskController extends GetxController{
  var taskList = [].obs;
  var taskTitle = ''.obs;
  var taskDescription = ''.obs;
  var taskDate = ''.obs;
  var taskTime = ''.obs;
  var taskStatus = false.obs;
  var taskIndex = 0.obs;

  void addTask(){
    taskList.add({
      'title': taskTitle.value,
      'description': taskDescription.value,
      'date': taskDate.value,
      'time': taskTime.value,
      'status': taskStatus.value,
    });
    taskTitle.value = '';
    taskDescription.value = '';
    taskDate.value = '';
    taskTime.value = '';
    taskStatus.value = false;
    Get.back();
  }

  void editTask(){
    taskList[taskIndex.value] = {
      'title': taskTitle.value,
      'description': taskDescription.value,
      'date': taskDate.value,
      'time': taskTime.value,
      'status': taskStatus.value,
    };
    taskTitle.value = '';
    taskDescription.value = '';
    taskDate.value = '';
    taskTime.value = '';
    taskStatus.value = false;
    Get.back();
  }

  void deleteTask(){
    taskList.removeAt(taskIndex.value);
    Get.back();
  }

  void changeStatus(){
    taskList[taskIndex.value]['status'] = taskStatus.value;
    Get.back();
  }
  void getTasks(){
    taskList = taskList;
  }
}

