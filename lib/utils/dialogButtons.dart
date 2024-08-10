//import 'dart:html';
import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String name;
  VoidCallback onPressed ;

  button({super.key,
  required this.name,
     required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: MaterialButton(onPressed: onPressed,
        color: Colors.white,
        child: Text(name),
      ),
    );
  }
}

