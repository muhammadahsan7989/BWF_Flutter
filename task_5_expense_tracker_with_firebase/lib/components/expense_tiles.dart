import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseTiles extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  final void Function(BuildContext)? editTapped;
  final void Function(BuildContext)? deleteTapped;
   ExpenseTiles(
      {super.key,
      required this.name,
      required this.amount,
      required this.dateTime,
      required this.deleteTapped,
      required this.editTapped});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
            onPressed: deleteTapped,
        icon: Icons.delete,
        backgroundColor: Colors.red,
        borderRadius: BorderRadius.circular(20),),
        SlidableAction( // Add this block
          onPressed: editTapped,
          icon: Icons.edit,
          backgroundColor: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
      ]),
      child: ListTile(
        title: Text(name),
        subtitle: Text(dateTime.day.toString() +
            '/' +
            dateTime.month.toString() +
            '/' +
            dateTime.year.toString()),
        trailing: Text('\Rs' + amount),
      ),
    );
  }
}
