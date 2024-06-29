import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/models/task.dart';


class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final void Function(String) onRemove;

  const TaskList(this.tasks, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 600,
      child: tasks.isEmpty ? Column(
        children: <Widget>[
          // ignore: prefer_const_constructors
          SizedBox(height: 20),
          Text(
            'Nenhuma tarefa cadastrada',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 20),
          // ignore: sized_box_for_whitespace
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ) : ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (ctx, index) {
          final task = tasks[index];
          // ignore: prefer_const_constructors
          return Card(
            elevation: 5,
            // ignore: prefer_const_constructors
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              // ignore: sized_box_for_whitespace
              leading: Container(
                width: 30,
                height: 30,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      )
                    ),
                    
                    side: WidgetStateProperty.all<BorderSide>(
                      BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      )
                    ),
                    
                  ),
                  onPressed: () => onRemove(task.id),
                  // ignore: prefer_const_constructors
                  child: Text(''),
                ),
              ),
              title: Text(
                task.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(task.date),
              ),
            ),
          );
        }
      )
    );
  }
}