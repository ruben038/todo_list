import 'package:flutter/material.dart';
import 'package:to_do_app/componants/btn_widget.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller ;
  VoidCallback onSaved;
  VoidCallback onCancel;
  DialogBox({super.key ,required this.controller ,required this.onSaved , required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyBtn(text: "Save", onPressed:onSaved,),
                const SizedBox(width: 10,),
                MyBtn(text: "Cancel", onPressed:onCancel,)
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.yellow[200],
    );
  }
}
