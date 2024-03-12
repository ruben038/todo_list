import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/pages/home_page.dart';
//import 'package:to_do_app/pages/todo.dart';

void main() async {

  await Hive.initFlutter();

  var box =await Hive.openBox("todoBox");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
        // ignore: prefer_const_constructors
      home:HomePage() ,
    );
  }
}
