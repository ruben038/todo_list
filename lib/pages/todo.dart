import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TextEditingController myController = TextEditingController();
  String greetingUser ="";
  void greetUser() {
    setState(() {
      greetingUser = "Hello  ${myController.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(greetingUser),
              TextField(
                controller: myController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Your name"),
              ),
              ElevatedButton(onPressed: greetUser, child: const Text("Click"))
            ],
          ),
        ),
      ),
    );
  }
}
