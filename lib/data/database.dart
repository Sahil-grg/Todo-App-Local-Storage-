import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
 List todoList = [];
  final _myBox = Hive.box("mybox");
  void createInitialData(){
    todoList = [
    ["example1" ,false],
      ["example2" ,false],
    ];
  }
  void loadData(){
   todoList=  _myBox.get("TODOLIST");
  }
  void updateDataBase(){
    _myBox.put("TODOLIST", todoList);
  }
}