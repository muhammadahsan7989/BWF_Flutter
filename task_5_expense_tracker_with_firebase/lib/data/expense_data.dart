//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:trackerapp/data/hive_data.dart';
import 'package:trackerapp/date_time_helper.dart';

import '../model/expense_item.dart';

class ExpenseData extends ChangeNotifier {
  // list

  List<ExpenseItem> overallExpenseList = [];

  // get
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }
  // prepare to display
  final db = HiveDataBase();
  void prepareData(){
    if(db.readData().isNotEmpty){
      overallExpenseList = db.readData();
    }
  }

  // add new

  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
    notifyListeners();
    db.savedData(overallExpenseList);
  }
// delete

  void deleteEpense(ExpenseItem expense){
    overallExpenseList.remove(expense);
    notifyListeners();
    db.savedData(overallExpenseList);
  }
  // day
String getDayName(DateTime dateTime)
{
  switch(dateTime.weekday){
    case 1:
      return 'Mon';
    case 2:
      return 'Tue';
    case 3:
      return 'Wed';
    case 4:
      return 'Thur';
    case 5:
      return 'Fri';
    case 6:
      return 'Sat';
    case 7:
      return 'Sun';
      default:
        return "";
  }


}
// exact date like sunday
DateTime StartOfWeekDate(){
    DateTime? startOfWeek;

    // get today
  DateTime today = DateTime.now();

  for(int i=0;i<7;i++){
    if(getDayName(today.subtract(Duration(days: i)))== 'Sun'){
      startOfWeek = today.subtract(Duration(days: i));
    }
  }
   return startOfWeek!;
}

Map<String,double> calculateDailyExpense(){
  Map<String,double> dailyExpense = {

  };
  for(var expense in overallExpenseList){
    String date = convertDateTimeToString(expense.dateTime);
    double amount = double.parse(expense.amount);
    if(dailyExpense.containsKey(date)){
      double currentAmount = dailyExpense[date]!;
      currentAmount+= amount;
      dailyExpense[date] = currentAmount;
    }
    else{
      dailyExpense.addAll({date: amount});
    }

  }
  return dailyExpense;
}

}
