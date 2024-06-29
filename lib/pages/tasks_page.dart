import 'package:flutter/material.dart';

import '../core/services/auth/auth_service.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
            Text('Tasks Page'),
            TextButton(
              onPressed: () {
                AuthService().logout();
              },
              // ignore: prefer_const_constructors
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
