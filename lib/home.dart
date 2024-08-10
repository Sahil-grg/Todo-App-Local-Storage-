import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager/data/database.dart';

import 'package:task_manager/utils/dialogBox.dart';
import 'package:task_manager/utils/todo-tile.dart';

import 'utils/openDrawer.dart';

class myHome extends StatefulWidget {
   myHome({super.key});
  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  final user = FirebaseAuth.instance.currentUser;

  final _myBox = Hive.box("mybox");
  ToDoDataBase db = ToDoDataBase();
  final ctl = TextEditingController();
  // List todoList = [
  //   ['Exercise',true],
  //   ['Gaming',true],
  //   ['Project',false],
  // ];

  void chkOnChanged(bool value , int index){
    db.todoList[index][1] = !db.todoList[index][1];
    setState(() {
    });
    db.updateDataBase();
  }
  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);

    });
    db.updateDataBase();
  }
  @override
  void initState() {
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
      db.loadData();
    }

    super.initState();
  }
  void createNewList(){
  showDialog(context: context, builder: (context){
    return Container(
      height: MediaQuery.of(context).size.height/1.4,
      child: dialogBox(
        controller: ctl,
        onSaved: () {
        var v = ctl.text.isEmpty;
        print(v);
        if(ctl.text.isEmpty){
          Navigator.of(context).pop();
        }
        else{
          setState(() {
            db.todoList.add([ctl.text,false]);
            Navigator.of(context).pop();
            ctl.clear();
            db.updateDataBase();
          });

        }
        },
        onCancel: () {
        Navigator.of(context).pop();
      },),
    );
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(

          children: [
            Container(
              height: 120,
              child: DrawerHeader(

                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blueAccent,),

                    title: Text('${user!.displayName}',)
                  )),
            ),

            Expanded(child: Container()),

            ListTile(
              onTap: (){
                FirebaseAuth.instance.signOut();
              },
              leading: Icon(Icons.logout),
              title: Text("Sign out"),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
        title: Text('ToDo App'),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                onTap: (){
                    Get.bottomSheet(

                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height/7,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.light_mode),
                              title: Text("Light mode"),
                              onTap: (){

                              }

                            ),
                            ListTile(
                              leading: Icon(Icons.dark_mode),
                              title: Text("Dark Mode"),
                              onTap: (){
                                Get.changeTheme(ThemeData.dark());
                              },
                            ),
                          ],
                        ),
                      )
                    );
                },
                child: Icon(Icons.settings)),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(onPressed: () {
            createNewList();
          },shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: Colors.blue.shade200,
            child: Icon(Icons.add),
          ),
        ),
      ),
      body: ListView.builder(itemCount: db.todoList.length,itemBuilder: (context,index){
        return ToDoTile(name: db.todoList[index][0], isDone: db.todoList[index][1], onChanged: (value)=>chkOnChanged(value!,index),
          deleteFunction: (context ) => deleteTask(index));
        },)
    );

}
}
