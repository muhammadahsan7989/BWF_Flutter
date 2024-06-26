import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trackerapp/bar%20graph/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

   MyBarGraph({super.key,
     required this.maxY,
     required this.sunAmount,
     required this.monAmount,
     required this.tueAmount,
     required this.wedAmount,
     required this.thurAmount,
     required this.friAmount,
     required this.satAmount});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sunAmount: sunAmount,
        monAmount: monAmount,
        tueAmount: tueAmount,
        wedAmount: wedAmount,
        thurAmount: thurAmount,
        friAmount: friAmount,
        satAmount: satAmount);
    myBarData.intializeBarData();

    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 50),
      child: BarChart(
          BarChartData(
              maxY: maxY,
              minY: 0,
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,
              getTitlesWidget: getBottomTitles))
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: true),
            barGroups: myBarData.barData.map((data) => BarChartGroupData(x: data.x,
            barRods: [
              BarChartRodData(
                toY: data.y,
              width: 10,
              borderRadius: BorderRadius.circular(4),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: maxY,
                color: Colors.white70
              ),
              ),
            ]
            ),
          ).toList()
          ),
      ),
    );

  }
}
Widget getBottomTitles (double value, TitleMeta meta){
  const style = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  Widget text;
  switch(value.toInt()){
    case 0:
      text = const Text('Sun',style:style);

      break;
    case 1:
      text = const Text('Mon',style:style);

      break;
      case 2:
    text = const Text('Tue',style:style);

    break;case 3:
    text = const Text('Wed',style:style);

    break;case 4:
    text = const Text('Thur',style:style);

    break;case 5:
    text = const Text('Fri',style:style);

    break;case 6:
    text = const Text('Sat',style:style);

    break;
    default:
    text = const Text('',style:style);

  break;

  }
  return SideTitleWidget(
    child: text,
    space: 8.0,
    axisSide: meta.axisSide,
  );

}