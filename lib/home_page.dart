import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/Todo_tile.dart';
import 'package:flutter_application_1/util/dialog_box.dart';

class HomePage extends StatefulWidget{ 
  const HomePage({super.key});

@override
State<HomePage> createState()=> _HomePageState();
}
class _HomePageState extends State<HomePage>{


  final _controller = TextEditingController();

  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
    ];


  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  
   void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
    });

    Navigator.of(context).pop();
    
    }
   
   void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
      return  DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: ()=> Navigator.of(context).pop(),
      );
    },
   );
  }

  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text('To Do'),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 158, 142, 1),
        ),
        
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index){
            return ToDoTile(taskName: toDoList[index][0],
             taskCompleted: toDoList[index][1], 
             onChanged: (value)=> checkBoxChanged(value,index),
             );
          },
          
        ),
    );
  }
  }
