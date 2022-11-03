import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controller/task_controller.dart';
import '../model/task.dart';


class TodoEdit extends StatelessWidget {
  final int? index;
  TodoEdit({Key? key, @required this.index}) : super(key: key);
  final TaskController taskController = Get.put(TaskController());
  final taskInstance = Task();
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        TextEditingController(text: taskController.tasks[index!].title);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: Get.height * 0.1,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width * 0.9,
                  height: Get.height * 0.25,
                  child: TextField(
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      // hintText: "What do you want to accomplish?",
                      label: const Text("Edit Task"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      // focusedBorder: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    autofocus: true,
                    controller: textEditingController,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Update'),
                  onPressed: () {
                    // var editing = taskController.tasks[index!];
                    // editing.title = textEditingController.text;
                    // taskController.tasks[index!] = editing;
                    taskController.updateTask(Task(
                      id: taskController.tasks[index!].id,
                      title: textEditingController.text,
                      isDone: taskController.tasks[index!].isDone,

                    )
                        );
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
class EditTodoPage extends StatelessWidget {
  final int? index;
  EditTodoPage({Key? key, @required this.index}) : super(key: key);

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
    TextEditingController(text: todoController.todoList[index!].text);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                // textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "Add task",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
                controller: textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ignore: deprecated_member_use
                RaisedButton(
                  child: const Text('Cancel'),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    Get.back();
                  },
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  child: const Text('Update'),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    var editing = todoController.todoList[index!];
                    editing.text = textEditingController.text;
                    todoController.todoList[index!] = editing;
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/
