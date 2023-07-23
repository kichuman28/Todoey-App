import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class addTaskScreen extends StatelessWidget {

  addTaskScreen({required this.addTaskCallback});

  final Function(String?) addTaskCallback;

  @override
  Widget build(BuildContext context) {
    late String newTasktitle;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff757575),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0, bottom: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.lightBlueAccent, fontSize: 40.0),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newTask){
                print(newTask);
                newTasktitle = newTask;
              },
            ),
              SizedBox(height: 60.0),
            MaterialButton(
                color: Colors.lightBlueAccent,
                height: 50.0,
                child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 30.0),),
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false).addTask(newTasktitle);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
