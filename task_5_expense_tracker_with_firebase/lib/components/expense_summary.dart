import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackerapp/bar%20graph/bar_graph.dart';
import 'package:trackerapp/data/expense_data.dart';

import '../date_time_helper.dart';
class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenseSummary({super.key,required this.startOfWeek});

  // calculate max expense
  double calculateMax(
      ExpenseData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday){
    double? max = 200;

    List<double> values = [
      value.calculateDailyExpense()[sunday] ?? 0,
      value.calculateDailyExpense()[monday] ?? 0,
      value.calculateDailyExpense()[tuesday] ?? 0,
      value.calculateDailyExpense()[wednesday] ?? 0,
      value.calculateDailyExpense()[thursday] ?? 0,
      value.calculateDailyExpense()[friday] ?? 0,
      value.calculateDailyExpense()[saturday] ?? 0,

    ];
    // sort small to large
    values.sort();
    // get largest value
    //increase slightly
    max = values.last * 1.1;
    return max == 0 ? 100 : max;


}
double calculateWeekTotal(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday)
{
  List<double> values = [
    value.calculateDailyExpense()[sunday] ?? 0,
    value.calculateDailyExpense()[monday] ?? 0,
    value.calculateDailyExpense()[tuesday] ?? 0,
    value.calculateDailyExpense()[wednesday] ?? 0,
    value.calculateDailyExpense()[thursday] ?? 0,
    value.calculateDailyExpense()[friday] ?? 0,
    value.calculateDailyExpense()[saturday] ?? 0,

  ];
  double total = 0;
  for(int i = 0; i<values.length; i++){
    total += values[i];

  }
  return double.parse(total.toStringAsFixed(2));
}



  @override
  Widget build(BuildContext context) {
    String sunday = convertDateTimeToString(startOfWeek.add(const Duration(days:0)));
    String monday = convertDateTimeToString(startOfWeek.add(const Duration(days:1)));
    String tuesday = convertDateTimeToString(startOfWeek.add(const Duration(days:2)));
    String wednesday= convertDateTimeToString(startOfWeek.add(const Duration(days:3)));
    String thursday = convertDateTimeToString(startOfWeek.add(const Duration(days:4)));
    String friday = convertDateTimeToString(startOfWeek.add(const Duration(days:5)));
    String saturday = convertDateTimeToString(startOfWeek.add(const Duration(days:6)));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20.0),
      child: Consumer<ExpenseData>(
        builder: (context,value, child)=> Column(
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: Row(
                children: [
                  Text('Weekly total: ',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('\Rs ${calculateWeekTotal(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday)}'),
                ],
              ),
          ),
            SizedBox(
              height: 200,
              child: MyBarGraph(
                  maxY: calculateMax(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday),
                  sunAmount: value.calculateDailyExpense()[sunday] ?? 0,
                  monAmount:  value.calculateDailyExpense()[monday] ?? 0,
                  tueAmount:  value.calculateDailyExpense()[tuesday] ?? 0,
                  wedAmount:  value.calculateDailyExpense()[wednesday] ?? 0,
                  thurAmount:  value.calculateDailyExpense()[thursday] ?? 0,
                  friAmount:  value.calculateDailyExpense()[friday] ?? 0,
                  satAmount:  value.calculateDailyExpense()[saturday] ?? 0),
            ),
          ],
        ),

      ),
    );
  }
}
