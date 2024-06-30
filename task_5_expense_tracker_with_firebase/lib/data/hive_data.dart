import 'package:hive/hive.dart';

import '../model/expense_item.dart';

class HiveDataBase{
  final _mybox = Hive.box("expense_database");
//write
  void savedData(List<ExpenseItem> allExpense){

      List<List<dynamic>> allExpensesFormatted = [];
      for(var expense in allExpense) {
        List<dynamic>  expenseformatted = [

        expense.name,
        expense.amount,
        expense.dateTime,

      ];
      allExpensesFormatted.add(expenseformatted);

    }
      _mybox.put("ALL_EXPENSES", allExpensesFormatted);
  }

  List<ExpenseItem> readData () {
    List savedExpenses = _mybox.get("ALL_EXPENSES") ?? [];
    List <ExpenseItem> allExpenses = [];

    for(int i = 0; i < savedExpenses.length; i++){
      // collect individual data
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];
// create expense item
      ExpenseItem expenseItem = ExpenseItem(
          name: name,
          amount: amount,
          dateTime: dateTime,
      );
      // add overall expense
      allExpenses.add(expenseItem);

    }
    return allExpenses;

  }

}