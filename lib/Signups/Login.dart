import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/Signups/ForgotPassword.dart';
import 'package:task_manager/Signups/SignupPage.dart';
import 'package:task_manager/Signups/Wrapper.dart';
import 'package:task_manager/utils/textFields.dart';

import '../utils/buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  void login() async{
    if(mailCont == "" && passCont ==" ")
      {
        Get.snackbar("error", "Please fill all the required fields");
      }
    else{
      try{
        UserCredential userCredential;
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: mailCont.text, password: passCont.text);
        Get.offAll(Wrapper());
      }on FirebaseAuthException catch(ex)
    {
      Get.snackbar("Error", ex.code.toString());
    }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
            horizontal: 20
          ),
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height:200,),
              Text("Let's Rejoin With Us" , style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    controller: mailCont,
                    decoration: InputDecoration(
                        hintText: "Enter Email",
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    controller: passCont,
                    decoration: InputDecoration(
                        hintText: "Enter password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap : (){
                      Get.to(()=>ForgotPass());
              },
                      child: Text("Forgot Password",
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 15
                      ),),
                    ),


                  ],
                ),
              ),
              // SizedBox(height: 15,),
              SizedBox(
                height: 25,
              ),

              buttons(
                  btnName: "Login", VoidCallback:  (){login();},
                  btnColor: Colors.blue.shade200, nameColor: Colors.white),

              // SizedBox(height: 25,),
              SizedBox(height: 35,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account? ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(SignUp());
                    },
                    child: Text("Sign up",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue
                    ),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
