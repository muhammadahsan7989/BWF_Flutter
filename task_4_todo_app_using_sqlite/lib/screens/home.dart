import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/widgets/todo_items.dart';

import '../model/todo.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList = Todo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildSearchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 20),
                        child: Text(
                          "All Todos",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (Todo todo in todosList.reversed)
                        TodoItems(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildAddTaskWidget(),
        ],
      ),
    );
  }

  void _handleToDoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(Todo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  Widget _buildSearchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 25,
            maxWidth: 20,
          ),
          hintText: 'Search',
          border: InputBorder.none,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white10,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          Container(
            width: 40,
            height: 40,
            child: ClipRect(
              child: Image.asset('assets/images.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddTaskWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 0),
                    blurRadius: 10.0,
                    spreadRadius: 10.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _todoController,
                decoration: InputDecoration(
                  hintText: 'Add new task',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {
                _addToDoItem(_todoController.text);
              },
              child: Text(
                '+',
                style: TextStyle(fontSize: 40),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 10,
                minimumSize: Size(60, 60),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
