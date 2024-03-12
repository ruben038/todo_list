import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyBtn extends StatelessWidget {
  final String text ;
  VoidCallback onPressed ;
  MyBtn({super.key, required this.text ,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}