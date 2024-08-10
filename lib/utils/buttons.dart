

import 'package:flutter/material.dart';

class buttons extends StatelessWidget {
  final btnName;
  final VoidCallback;
  final btnColor;
  final nameColor;
  const buttons({super.key, required this.btnName, required this.VoidCallback, required this.btnColor, required this.nameColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap : VoidCallback,
      child: Container(
        width: MediaQuery.of(context).size.width/1.2,
       height: 50,
       decoration: BoxDecoration(
         color: btnColor,
         borderRadius: BorderRadius.circular(20)
       ),
       child: Center(
         child: Text(
          btnName , style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: nameColor
               ),),
       )),
    );
  }
}
