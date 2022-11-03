import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_local_sqflite/view/add_todo_page.dart';
import 'package:getx_todo_local_sqflite/view/todo_home_page.dart';

import 'db/db_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDatabase();
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  static const String title = 'Todo GetX & sqflite';

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      title: title,
      debugShowCheckedModeBanner: false,
      initialRoute: TodoHomePage.id,
      getPages: [
        GetPage(name: AddTodoPage.id, page: () => AddTodoPage()),
        GetPage(name: TodoHomePage.id, page: () => TodoHomePage()),
      ],
    );
  }
}