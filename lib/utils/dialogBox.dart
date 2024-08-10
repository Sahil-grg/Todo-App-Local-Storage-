import 'package:flutter/material.dart';
import 'package:task_manager/utils/dialogButtons.dart';

class dialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;
  dialogBox({super.key,
  required this.controller,
  required this.onSaved,
  required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade200,
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        height: MediaQuery.of(context).size.height/ 5.8,
        child: Column(
          children: [
            SizedBox(height: 10,),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54
                  )
                ),
                hintText: 'Add new event '
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: button(name: 'Save', onPressed: onSaved),
                ),
                button(name: 'Cancel', onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
