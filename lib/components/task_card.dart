import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../core/models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  // final void Function(String) onRemove;

  const TaskCard({
    super.key, 
    required this.task, 
    // required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
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
            onPressed: () {},
            // ignore: prefer_const_constructors
            child: Text(''),
          ),
        ),
        title: Text(
          task.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(task.deliveryDate),
        ),
      ),
    );
  }
}