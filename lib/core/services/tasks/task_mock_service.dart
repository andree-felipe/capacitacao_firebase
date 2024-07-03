import 'dart:async';
import 'dart:math';

import '../../models/task.dart';
import 'task_service.dart';

class TaskMockService implements TaskService {
  static final List<Task> _tasks = [
    Task(
      id: '1',
      title: 'Trabalho final POO',
      deliveryDate: DateTime.now(),
    ),
    Task(
      id: '2',
      title: 'P2 - Computação Visual',
      deliveryDate: DateTime.now(),
    ),
  ];
  static MultiStreamController<List<Task>>? _controller;
  static final _tasksStream = Stream<List<Task>>.multi((controller) {
    _controller = controller;
    controller.add(_tasks);
  });

  Stream<List<Task>> tasksStream() {
    return _tasksStream;
  }

  Future<Task> save(String title, DateTime deliveryDate) async {
    final newTask = Task(
      id: Random().nextDouble().toString(),
      title: title,
      deliveryDate: deliveryDate,
    );
    _tasks.add(newTask);
    _controller?.add(_tasks);
    return newTask;
  }
}
