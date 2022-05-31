
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class pie extends StatelessWidget {

  final Map<String,double> pieData;
  pie({required this.pieData});

  @override

  Widget build(BuildContext context) {
 return
  PieChart(
  dataMap: pieData.isEmpty ? {"No selection" : 0.0} : pieData,
  animationDuration: const Duration(microseconds: 800),
  chartLegendSpacing: 32,
  chartRadius: MediaQuery.of(context).size.width/2.5,
   colorList: const [
      Colors.blue,
      Colors.deepPurpleAccent,
      Colors.green,
      Colors.yellow,
      Colors.lightBlueAccent,
      Colors.pink,
      Colors.deepOrangeAccent,
      Colors.grey,
      Colors.red,
      Colors.orange,
   ],
  initialAngleInDegree: 0,
  chartType: ChartType.ring,
  ringStrokeWidth: 32,
  centerText: "Total analyses",
   legendOptions: const LegendOptions(
      showLegends: false,
      legendPosition: LegendPosition.right,
      showLegendsInRow: true,
      legendShape: BoxShape.circle,
      legendTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
   ),
  ),
    chartValuesOptions: const ChartValuesOptions(
      showChartValueBackground: true,
      showChartValues: true,
      showChartValuesInPercentage: false,
      decimalPlaces: 1,
    ),

   );
  }
}



