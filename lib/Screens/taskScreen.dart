import 'package:flutter/material.dart';
import 'package:todoey/widgets/TasksLists.dart';
import 'package:todoey/Screens/addTaskScreen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 60.0, bottom: 30.0, right: 30.0, left: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35.0,
                    child: Icon(
                      Icons.list,
                      size: 70.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Add your tasks below!',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Press and hold the tasks to delete them from the list.',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: TasksView(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(
            Icons.add,
            size: 40.0,
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                        child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: addTaskScreen(addTaskCallback: (newTaskTitle) {
                        // Provider.of<TaskData>(context).add(Task(name: newTaskTitle, isDone: false));
                        Navigator.pop(context);
                      }),
                    )));
          }),
    );
  }
}
