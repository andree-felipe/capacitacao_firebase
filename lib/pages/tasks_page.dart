import 'dart:math';
import 'package:capacitacao_firebase/componentes/task_form.dart';
import 'package:capacitacao_firebase/componentes/task_list.dart';
import 'package:flutter/material.dart';
import '../core/models/task.dart';
import '../core/services/auth/auth_service.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final List<Task> _tasks = [];

  // Método de adição de uma task na lista
  _addTask(String title, DateTime date) {
    final newTask = Task(
      id: Random().nextDouble().toString(),
      title: title,
      date: date,
    );

    setState(() {
      _tasks.add(newTask);
    });

    Navigator.of(context).pop();
  }

  // Método para deletar uma task da lista
  _deleteTask(String id) {
    setState(() {
      _tasks.removeWhere((task) => task.id == id);
    });
  }

  // Método para abrir o modal de preenchimento do formulário
  _openTaskFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TaskForm(_addTask);
        });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          "ToDo App",
          // ignore: prefer_const_constructors
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => _openTaskFormModal(context),
          )
        ],
      ),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        // ignore: prefer_const_constructors
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TaskList(_tasks, _deleteTask),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => _openTaskFormModal(context),
      ),
      // ignore: avoid_unnecessary_containers
      bottomSheet: Container(
        color: Colors.transparent,
        // ignore: prefer_const_constructors
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            TextButton(
              // ignore: prefer_const_constructors
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all<Color>(Colors.transparent),
              ),
              onPressed: () {
                AuthService().logout();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
