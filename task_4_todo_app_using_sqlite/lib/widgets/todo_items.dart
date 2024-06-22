import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TodoItems extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onToDoChanged;
  final Function(String) onDeleteItem;

  TodoItems({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_circle_outlined : Icons.radio_button_unchecked,
          color: Colors.lightBlueAccent,
        ),
        title: Text(
          todo.todoText,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: () {
              onDeleteItem(todo.id);
            },
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
