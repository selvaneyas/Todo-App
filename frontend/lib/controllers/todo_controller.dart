import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class TodoController {
  final String baseUrl = 'https://todo-app-4sbe.onrender.com/tasks';

  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> taskJson = json.decode(response.body);
        _tasks = taskJson.map((json) => Task.fromJson(json)).toList();
      }
    } catch (e) {
      print("Fetch error: $e");
    }
  }

  Future<void> addTask(String title) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': title,
        'date': DateTime.now().toIso8601String(),
        'done': false
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      await fetchTasks();
    }
  }

  Future<void> deleteTask(int id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
    await fetchTasks();
  }

  // Future<void> toggleTask(Task task) async {
  //   final updated = Task(
  //     id: task.id,
  //     title: task.title,
  //     date: task.date,
  //     isDone: !task.isDone,
  //   );

  //   await http.put(
  //     Uri.parse('$baseUrl/${task.id}'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(updated.toJson()),
  //   );
  //   await fetchTasks();
  // }
  //
  // Future<void> toggleTask(Task task) async {
  //   task.isDone = !task.isDone; // Toggle directly on the current object

  //   final response = await http.put(
  //     Uri.parse('$baseUrl/${task.id}'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(task.toJson()),
  //   );

  //   if (response.statusCode == 200 || response.statusCode == 204) {
  //     // No need to fetch again; you already updated the object
  //   } else {
  //     print("Toggle failed: ${response.statusCode}");
  //   }
  // }
  //
  Future<void> toggleTask(Task task) async {
    final updated = Task(
      id: task.id,
      title: task.title,
      date: task.date,
      isDone: !task.isDone,
    );

    final response = await http.put(
      Uri.parse('$baseUrl/${task.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updated.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      task.isDone = updated.isDone;
      await fetchTasks();
      print("${response.statusCode}");
      print("Response: ${response.body}");
    } else {
      print("Toggle failed: ${response.statusCode}");
      print("Response: ${response.body}");
    }
  }

  int get completedCount => _tasks.where((task) => task.isDone).length;
}
