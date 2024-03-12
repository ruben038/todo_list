import 'package:hive/hive.dart';

class TodoData {
  final _todoBox = Hive.box("todoBox");
  List todoTask = [];

  void createInitialTask(){
    todoTask =[
      ["Pray",false],
      ["Read Bible",false]
    ];
  }
  void loadData () {
    todoTask = _todoBox.get("TODOLIST"); 
  }
  void updateData () {
    _todoBox.put("TODOLIST", todoTask);
  }
}