import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget{
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  
  ToDoTile ({super.key, 
  required this.taskName,
  required this.taskCompleted,
  this.onChanged,
  });
 
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25,top:25,),
      child: Container(
        padding: EdgeInsets.all(24),
    decoration: BoxDecoration(color: const Color.fromARGB(255, 199, 193, 42),
    borderRadius: BorderRadius.circular(15)
       ),
        child: Row(
          children: [
            Checkbox(value: taskCompleted,
             onChanged: onChanged,
             activeColor: Colors.black, 
            ),
          
            Text(
              taskName,
              style: TextStyle(decoration: taskCompleted ? 
              TextDecoration.lineThrough: 
              TextDecoration.none),
            ),
          ],
        ),
      ),
    );
}
}