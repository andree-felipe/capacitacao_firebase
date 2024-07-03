import 'package:capacitacao_firebase/core/services/tasks/task_mock_service.dart';

import '../../models/task.dart';

abstract class TaskService {
  Stream<List<Task>> tasksStream();
  Future<Task> save(String title, DateTime deliveryDate);

  factory TaskService() {
    return TaskMockService();
  }
}