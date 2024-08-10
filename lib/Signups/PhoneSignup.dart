import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneSignup extends StatelessWidget {
  // const PhoneSignup({super.key});
 TextEditingController phnCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 250,),
          Text("Signup with Your Mobile No",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: phnCont,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Fill your mobile no",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )

              ),
            ),
          )
        ],
      ),
    );
  }
}
