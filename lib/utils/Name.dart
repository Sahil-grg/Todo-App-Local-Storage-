import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/buttons.dart';

import '../Signups/Wrapper.dart';

class Name extends StatelessWidget {
  // const Name({super.key});
 TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 200,),
          Text("Enter your Name",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: TextField(
              controller: name,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )

              ),
            ),
          ),
          buttons(
              btnName: "Submit", VoidCallback:  (){
                Get.offAll(Wrapper());
                    },
              btnColor: Colors.blue.shade200, nameColor: Colors.white),
        ],
      ),
    );
  }
}
