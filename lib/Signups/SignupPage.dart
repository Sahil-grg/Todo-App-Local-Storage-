import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/Signups/Login.dart';
import 'package:task_manager/Signups/PhoneSignup.dart';
import 'package:task_manager/Signups/Wrapper.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utils/buttons.dart';
import '../utils/textFields.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  googleSignin() async{
    final GoogleSignInAccount? googleUser = await googleSignin().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
  Sign()async{
    if(email==" " && password =="")
    {
      Get.snackbar("error", "Please fill the required fields");
    }
    else{
      try {
        UserCredential userCredential;
        userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        // Get.to(HomePage());
        Get.offAll(Wrapper());
      } on FirebaseAuthException catch(ex)
      {
        Get.snackbar("Error", ex.code);
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height:200,),
            Text("Let's Connect With Us" , style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      hintText: "Enter your name",
                      prefixIcon: Icon(Icons.drive_file_rename_outline),
                      border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20)
                      )
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: email,
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
                  controller: password,
                  decoration: InputDecoration(
                      hintText: "Enter password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                  )
              ),
            ),
            SizedBox(height: 20,),
            buttons(
                btnName: "Create your account", VoidCallback:  (){Sign();},
                btnColor: Colors.blue.shade200, nameColor: Colors.white),
        SizedBox(height: 20),
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
                Get.to(LoginPage());
              },
              child: Text("Login",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue
                ),),
            ),

          ],
        ),
            SizedBox(height: 20,),
            
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //
            //       onPressed: (){
            //         googleSignin();
            //       },
            //       icon: Icon(Icons.g_mobiledata_rounded, size: 40,),
            //     ),
            //     SizedBox(
            //       width: 30,
            //     ),
            //     IconButton(
            //
            //       onPressed: (){
            //         Get.to(PhoneSignup());
            //       },
            //       icon: Icon(Icons.phone, size: 30,),
            //     )
            //   ],
            // )
        ]
      )
      ),
    );
  }
}



