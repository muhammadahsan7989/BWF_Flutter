import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackerapp/components/expense_summary.dart';
import 'package:trackerapp/components/expense_tiles.dart';
import 'package:trackerapp/data/expense_data.dart';
import 'package:trackerapp/model/expense_item.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final newExpenseNameController = TextEditingController();

  final newExpenseDollarController = TextEditingController();

  final newExpenseCentsController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  void addNewExpense(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add new expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newExpenseNameController,
              decoration: InputDecoration(hintText: 'Expense name'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: newExpenseDollarController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Rupees'),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: newExpenseCentsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Payse'),
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: () => save(context),
            child: Text('Save'),
          ),
          MaterialButton(
            onPressed: () => cancel(context),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
  // delete expense
  void deleteExpense(ExpenseItem expense){
    Provider.of<ExpenseData>(context, listen: false).deleteEpense(expense);

  }

  void clear() {
    newExpenseNameController.clear();
    newExpenseDollarController.clear();
    newExpenseCentsController.clear();
  }

  void save(BuildContext context) {
    if (newExpenseNameController.text.isNotEmpty &&
        newExpenseDollarController.text.isNotEmpty &&
        newExpenseCentsController.text.isNotEmpty) {
      String amount =
          newExpenseDollarController.text + '.' +
              newExpenseCentsController.text;
      ExpenseItem newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: amount,
        dateTime: DateTime.now(),
      );
      Provider.of<ExpenseData>(context, listen: false).addNewExpense(
          newExpense);
    }
      Navigator.pop(context);
      clear();

  }
  void cancel(BuildContext context) {
    Navigator.pop(context);
    clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: Color(0xFFD5F4E6),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => addNewExpense(context),
              backgroundColor: Colors.white70,
            ),
            appBar: AppBar(
              title: const Text('Dashboard'),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                ExpenseSummary(startOfWeek: value.StartOfWeekDate()),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.getAllExpenseList().length,
                  itemBuilder: (context, index) => ExpenseTiles(
                    name: value.getAllExpenseList()[index].name,
                    dateTime: value.getAllExpenseList()[index].dateTime,
                    amount: value.getAllExpenseList()[index].amount,
                    deleteTapped: (p0)=> deleteExpense(value.getAllExpenseList()[index]),
                  ),
                )
              ],
            )));
  }
}
