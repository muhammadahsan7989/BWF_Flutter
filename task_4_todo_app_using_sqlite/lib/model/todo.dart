class Todo {
  String id;
  String todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todoText': todoText,
      'isDone': isDone ? 1 : 0,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      todoText: map['todoText'],
      isDone: map['isDone'] == 1,
    );
  }

  static List<Todo> todoList() {
    return [
      Todo(id: '01', todoText: 'Breakfast', isDone: true),
      Todo(id: '02', todoText: 'Coding Practice', isDone: true),
      Todo(id: '03', todoText: 'Watch movie'),
      Todo(id: '04', todoText: 'Football'),
      Todo(id: '05', todoText: 'Dinner'),
      Todo(id: '06', todoText: 'Read book'),
    ];
  }
}
