import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_local_sqflite/db/db_helper.dart';

import '../model/task.dart';


class TaskController extends GetxController {
  var tasks =<Task>[].obs;
  var taskById = <Task>[].obs;
  var completedTasks = <Task>[].obs;

  @override
  void onInit() {
    // DBHelper.initDatabase();
    getAllTasks();
    super.onInit();
  }

  Future<void> addTask(String title) async {
    final task = Task(title: title,isDone: 0);
    // tasks.add(task);
    await DBHelper.insert(task);

    if (kDebugMode) {
      print("addTask Clicked, task title: ${task.title},list length: ${tasks.length}");
    }
  }

  void getAllTasks() async {
    final allTasks = await DBHelper.  query();
    if (allTasks != null) {
      tasks.value = allTasks.map((e) => Task.fromJson(e)).toList().obs;
    }
    update();

  }

  void deleteTask(Task task) async {
    // tasks.remove(task);
    await DBHelper.delete(task);
    getAllTasks();
    update();
    if (kDebugMode) {
      print("deleteTask Clicked,list length: ${tasks.length}");
    }
  }

  void updateTaskAsDone(Task task) async {
    task.isDone = 1;
    await DBHelper.updateTask(task);
    // getAllTasks();
    update();
    if (kDebugMode) {
      print("updateTaskAsDone clicked${task.isDone}");
    }
  }

  void updateTaskAsNotDone(Task task) async {
    task.isDone = 0;
    await DBHelper.update(task.id!);
    // getAllTasks();
    update();
    if (kDebugMode) {
      print("updateTaskAsNotDone clicked${task.isDone}");
    }
  }

  void updateTask(Task task) async {
    await DBHelper.updateTask(task);
    getAllTasks();
    update();
    if (kDebugMode) {
      print("updateTask clicked, task status: ${task.isDone},list length: ${tasks.length}");
    }
  }

  void getTaskById(int id) async {
List<Map<String,dynamic>>? task = await DBHelper.queryTaskById(id);
taskById.assignAll(task.map((e) => Task.fromJson(e)));
  }


}