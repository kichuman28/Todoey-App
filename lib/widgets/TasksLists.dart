import 'package:flutter/material.dart';
import 'package:todoey/widgets/TasksTile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';


class TasksView extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return       ListView.builder(
          padding: EdgeInsets.only(left: 28.0, top: 40.0),
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TasksTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
              },
              longPressCallback: (){
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.tasks.length,
        );
      },

    );
  }
}
