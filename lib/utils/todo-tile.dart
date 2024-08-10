import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatelessWidget {
  final name;
  final isDone;
  void Function(bool?) onChanged;
  Function(BuildContext)? deleteFunction;

   ToDoTile({super.key,
   required this.name,
   required this.isDone,
   required this.onChanged,
  required this.deleteFunction
   });


@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,top: 20,right: 15),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [

              SlidableAction(onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),)
            ]),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200,
            boxShadow: [
              BoxShadow(
              offset: Offset(2, 2),
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 20
              )
            ],

          ),
          child: Row(
            children: [
              Checkbox(value: isDone, onChanged: onChanged,activeColor: Colors.black38),
              SizedBox(width: 20,),
              Text(name,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 16,
              decoration: isDone? TextDecoration.lineThrough : TextDecoration.none,
                  decorationThickness: 2,
                  decorationStyle: TextDecorationStyle.solid
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
