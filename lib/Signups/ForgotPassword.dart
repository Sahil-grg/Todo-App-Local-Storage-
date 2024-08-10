import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/buttons.dart';
import '../utils/dialogButtons.dart';

class ForgotPass extends StatelessWidget {
  TextEditingController mailCont = TextEditingController();
  // const ForgotPassWord({super.key});
  forgotPass()async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: mailCont.text);
      Get.snackbar("Link Sent" , "Password reset link have been sent to your mail");
    }on FirebaseAuthException catch(e)
    {
      Get.snackbar("Error" , e.code);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar : AppBar(
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 40),
        child: Column(
          children: [
            TextField(
              controller: mailCont,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter your Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: buttons(btnName: "Reset Password", VoidCallback: (){
                forgotPass();
              }, btnColor: Colors.blue.withOpacity(0.3), nameColor: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
