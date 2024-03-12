import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/componants/dialog_box.dart';
import 'package:to_do_app/componants/todo_tile.dart';
import 'package:to_do_app/data/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todoBox = Hive.box('todoBox');
  TodoData db = TodoData();

  @override
  void initState() {
    if (_todoBox.get("TODOLIST") == null) {
      db.createInitialTask();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoTask[index][1] = !db.todoTask[index][1];
    });
    db.updateData();
  }

  void saveTask() {
    setState(() {
      db.todoTask.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateData();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSaved: saveTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deletedTask(int index) {
    setState(() {
      db.todoTask.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Center(child: Text("TODO APP"),),
        backgroundColor: Colors.yellow, 
        elevation: 0,
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          createNewTask();
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TodoList(
            taskName: db.todoTask[index][0],
            taskCompleted: db.todoTask[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deletedTask(index),
          );
        },
        itemCount: db.todoTask.length,
      ),
    );
  }
}
