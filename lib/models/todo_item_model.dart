class ToDoItemModel {
  String id;
  String text;
  bool isComplete;

  ToDoItemModel({
    required this.id,
    required this.text,
    this.isComplete = false,
  });

  static List<ToDoItemModel> todoList() {
    return [
      ToDoItemModel(id: '1', text: "Tarefa 1", isComplete: true),
      ToDoItemModel(id: '2', text: "Tarefa 2", isComplete: true),
      ToDoItemModel(id: '3', text: "Tarefa 3"),
      ToDoItemModel(id: '4', text: "Tarefa 4"),
      ToDoItemModel(id: '5', text: "Tarefa 5"),
      ToDoItemModel(id: '6', text: "Tarefa 6", isComplete: true),
      ToDoItemModel(id: '7', text: "Tarefa 7", isComplete: true),
      ToDoItemModel(id: '8', text: "Tarefa 8"),
    ];
  }
}
