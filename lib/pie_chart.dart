
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class graph extends StatelessWidget{

  Map<String,double>data={
    "this month":33,
    "last month":22,

  };


  @override

  Widget build(BuildContext context) {
    return Scaffold(
appBar:AppBar(
  title:Text("Total analysis"),
),
    body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
      PieChart(
        dataMap: data,
        animationDuration: Duration(microseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width/3.2,
        colorList: [
          Colors.blue,
          Colors.green,
          Colors.yellow,
          Colors.pink,
          Colors.grey,
          Colors.red,
        ],
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 32,
        centerText: "Total analys",
        legendOptions: LegendOptions(
          showLegends: false,
          legendPosition: LegendPosition.right,
          showLegendsInRow: true,
          legendShape: BoxShape.circle,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: false,
          decimalPlaces: 1,
        ),

      ),


      ],
    ),


    );
  }
  }



