import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager/Signups/Login.dart';
import 'package:task_manager/Signups/Wrapper.dart';
import 'package:task_manager/data/CrudOperations.dart';
import 'home.dart';
import 'package:get/get.dart';


void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox("mybox");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch:  Colors.brown
      ),
      home: Wrapper(),
    );
  }
}