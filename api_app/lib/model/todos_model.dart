class TodosModel {
  final int userId, id;
  final String title;
  final bool completed;
  TodosModel({
    required this.completed,
    required this.title,
    required this.userId,
    required this.id,
  });
  factory TodosModel.fromJson(Map<String, dynamic> jsonData) {
    return TodosModel(
        completed: jsonData['completed'],
        title: jsonData['title'],
        userId: jsonData['userId'],
        id: jsonData['id']);
  }
}
