class Task {
  final int id;
  final String title;
  final DateTime date;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.date,
    this.isDone = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      date: DateTime.parse(json['date']),
      isDone: json['done'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date.toIso8601String(),
        'done': isDone,
      };
}
