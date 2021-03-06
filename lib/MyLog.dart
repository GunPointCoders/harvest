// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';

//import 'package:dropdown_search2/dropdown_search2.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:harvest/atlas.dart';
import 'package:harvest/pie_chart.dart';
//import 'package:flutter_dropdown_search/flutter_dropdown_search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'graph_data.dart';
import 'chart_model.dart';

import 'package:http/http.dart' as http;

//import 'package:dropdown_search/dropdown_search.dart';

import 'package:searchfield/searchfield.dart';

class filter_page extends StatefulWidget {
  const filter_page({Key? key}) : super(key: key);

  @override
  _filter createState() => _filter();
}

class _filter extends State<filter_page> {
  // final List<ProduceTimeline>data=[ //some data to display on the bar graph
  //   ProduceTimeline(months: "jan", quantity: 50, barColor: charts.ColorUtil.fromDartColor(Colors.green)),
  //   ProduceTimeline(months:"Feb",quantity:10, barColor: charts.ColorUtil.fromDartColor(Colors.green)),
  //   ProduceTimeline(months: "Mar", quantity: 30, barColor: charts.ColorUtil.fromDartColor(Colors.green)),
  //   ProduceTimeline(months:"Apr",quantity:15, barColor: charts.ColorUtil.fromDartColor(Colors.green)),

  // ];

  final List<ProduceTimeline> data = [];

  late Map<String, double> pieData = {};



  String monthValue = "Select Months";
  String foodValue = 'Select Food';
  String typeValue = 'Select Type';
  String subtypeValue = "Select subtype";
  String supertypeValue = "Select supertype";

  var Supertype = ['Fruit', 'Flower', 'Vegetable', 'Herb'];
  var Subtype = [
    'Apple',
    'Artichoke',
    'Edible Flower',
    'Nasturtium',
    'Aubergine',
    'Chilli',
    'Pepper',
    'Tomato',
    'Basil',
    'Coriander',
    'Fennel',
    'Lemon Balm',
    'Mint',
    'Parsley',
    'Bean',
    'Pea',
    'Beetroot',
    'Carrot',
    'Ginger',
    'Jerusalem Artichoke',
    'Radish',
    'Sweet Potato',
    'Turmeric',
    'Turnip',
    'Blackberry',
    'Blueberry',
    'Gooseberry',
    'Kei Apple ',
    'Strawberry',
    'Broccoli',
    'Cabbage',
    'Cauliflower',
    'Kale',
    'Squash',
    'Cucumber',
    'Pumpkin',
    'Zucchini',
    'Celery',
    'Rhubarb',
    'Chive',
    'Leek',
    'Onion',
    'Fig',
    'Granadilla',
    'Grape',
    'Grapefruit',
    'Lemon',
    'Lime',
    'Naartjie',
    'Orange ',
    'Lemon Verbena ',
    'Marjoram',
    'Rosemary',
    'Sage',
    'Thyme',
    'Lettuce ',
    'Mustard Leaf',
    'Sorrel',
    'Spinach',
    'Peach',
    'Plum',
    'Sunflower Seed '
  ];

  var Type = [
    'Select Type',
    'Allium',
    'Berry',
    'Citrus',
    'Cruciferos',
    'Curcubit',
    'False Fruit',
    'Flower',
    'Leaf',
    'Legume',
    'Nightshade',
    'Nut',
    'Prome Fruit',
    'Root',
    'Seed',
    'Soft Herb',
    'Stalk',
    'Stone Fruit',
    'Vine Fruit',
    'Hard Herb'
  ];

  var food = [
    'Select Food',
    'Almond',
    'Apple (Golden Delicious)',
    'Apple (Granny Smith)',
    'Artichoke',
    'Edible Flower',
    'Nasturtium',
    'Aubergine',
    'Chilli (Birdseye)',
    'Chilli (Serrano)',
    'Pepper (Green California Wonder)',
    'Pepper (Red Santorini)',
    'Tomato (Cherry)',
    'Tomato (Costoluto)',
    'Tomato (Floradade)',
    'Tomato (Moneymaker)',
    'Tomato (St. Pierre)',
    'Tomato (Yellow Baby)',
    'Basil',
    'Coriander',
    'Fennel',
    'Lemon Balm',
    'Mint',
    'Parsley',
    'Bean (Broad)',
    'Bean (Flat)',
    'Bean (Green)',
    'Bean (Yellow)',
    'Bean (Black)',
    'Bean (Black-Eyed)',
    'Bean (Purple)',
    'Pea',
    'Beetroot',
    'Carrot',
    'Ginger',
    'Jerusalem Artichoke',
    'Radish',
    'Sweet Potato (White)',
    'Sweet Potato (Orange)',
    'Turmeric',
    'Turnip',
    'Blackberry',
    'Blueberry',
    'Gooseberry',
    'Kei Apple',
    'Strawberry',
    'Broccoli',
    'Cabbage (Chinese)',
    'Cabbage (Purple)',
    'Cauliflower',
    'Cavolo Nero',
    'Kale',
    'Butternut Squash',
    'Gem Squash',
    'Cucumber',
    'Pumpkin (Boerpampoen)',
    'Pumpkin (Queensland Blue)',
    'Zucchini (Green)',
    'Celery',
    'Rhubarb',
    'Chive',
    'Leek',
    'Onion (Red)',
    'Onion (White)',
    'Shallot',
    'Fig (Green)',
    'Fig (Purple)',
    'Granadilla',
    'Grape (Catawba)',
    'Grape (Hanepoot)',
    'Grape (Victoria)',
    'Grapefruit (Ruby)',
    'Lemon',
    'Lime',
    'Naartjie',
    'Orange (Cara Cara)',
    'Orange (Valencia)',
    'Lemon Verbena',
    'Marjoram',
    'Rosemary',
    'Sage',
    'Thyme',
    'Lettuce',
    'Mustard Leaf',
    'Sorrel',
    'Spinach',
    'Peach (White)',
    'Peach (Yellow)',
    'Plum (Yellow)',
    'Plum (Red)',
    'Plum (Purple)',
    'Plum (Purple Leaf)',
    'Sunflower Seed'
  ];

  var month = [
    'Select Months',
    'This month',
    'Last 3 months',
    'Last 6 months',
    'Year'
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(" My Log"),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, //position of column
              children: <Widget>[
                const SizedBox(height: 20),

                ExpansionTile(
                  //the tile that holds all the things under filter

                    title: const Text(
                      "Filter",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      //all under of expansion tile, i.e dropdowns
                      Column(
                        children: <Widget>[
                          CustomSearchableDropDown(
                            dropdownHintText: 'Search For time period ',
                            showLabelInMenu: true,
                            primaryColor: Colors.red,
                            menuMode: true,
                            labelStyle: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            items: month,
                            label: 'Select time period',
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(Icons.search),
                            ),
                            dropDownMenuItems: month.map((item) {
                              return item;
                            }).toList() ??
                                [],
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  monthValue = value;
                                });
                              } else {
                                print(null);
                              }
                            },
                          ),

                          CustomSearchableDropDown(
                            dropdownHintText: 'Search For sub type ',
                            showLabelInMenu: true,
                            primaryColor: Colors.red,
                            menuMode: true,
                            labelStyle: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            items: Type,
                            label: 'Select sub type',
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(Icons.search),
                            ),
                            dropDownMenuItems: Subtype.map((item) {
                              return item;
                            }).toList() ??
                                [],
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  subtypeValue = value;
                                });
                              } else {
                                print(null);
                              }
                            },
                          ),

                          CustomSearchableDropDown(
                            dropdownHintText: 'Search For type ',
                            showLabelInMenu: true,
                            primaryColor: Colors.red,
                            menuMode: true,
                            labelStyle: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            items: Type,
                            label: 'Select type',
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(Icons.search),
                            ),
                            dropDownMenuItems: Type.map((item) {
                              return item;
                            }).toList() ??
                                [],
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  typeValue = value;
                                });
                              } else {
                                print(null);
                              }
                            },
                          ),

                          CustomSearchableDropDown(
                            dropdownHintText: 'Search For super type ',
                            showLabelInMenu: true,
                            primaryColor: Colors.red,
                            menuMode: true,
                            labelStyle: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            items: Type,
                            label: 'Select super type',
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(Icons.search),
                            ),
                            dropDownMenuItems: Supertype.map((item) {
                              return item;
                            }).toList() ??
                                [],
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  supertypeValue = value;
                                });
                              } else {
                                print(null);
                              }
                            },
                          ),

                          CustomSearchableDropDown(
                            dropdownHintText: 'Search For food type ',
                            showLabelInMenu: true,
                            primaryColor: Colors.red,
                            menuMode: true,
                            labelStyle: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            items: food,
                            label: 'Select food type',
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(Icons.search),
                            ),
                            dropDownMenuItems: food.map((item) {
                              return item;
                            }).toList() ??
                                [],
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  foodValue = value;
                                });
                              } else {
                                print(null);
                              }
                            },
                          ),
                        ],
                      )
                    ]),

                const SizedBox(height: 30),

                Container(
                  //holds the bar chart
                  height: 400,
                  padding: const EdgeInsets.all(12),
                  color: Colors.white70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        child: pie(
                          pieData: pieData,
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        child: graph(
                          data: data,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: () async {
                          data.clear();
                          pieData = {};

                          final prefs = await SharedPreferences.getInstance();
                          String farmer_id = prefs.getString('farmer_id')!;
                          String log_id = prefs.getString('log_id')!;

                          var monthV;
                          var noMonths;
                          DateTime now = DateTime.now();
                          String curMonth = DateTime(now.year, now.month, now.day).toString();

                          int currentMonth = int.parse(curMonth.split('-')[1]);

                          if (monthValue == 'Select Months') {
                            monthV = '7';
                          } else if (monthValue == 'This month') {
                            monthV = '30';
                            noMonths = 1;
                          } else if (monthValue == 'Last 3 months') {
                            monthV = '90';
                            noMonths = 3;
                          } else if (monthValue == 'Last 6 months') {
                            monthV = '180';
                            noMonths = 6;
                          } else if (monthValue == 'Year') {
                            monthV = '365';
                            noMonths = 12;
                          }
                          http.Response response = await http.post(
                              Uri.parse("http://10.100.15.123/graph.php"),
                              body: ({
                                'items': foodValue,
                                'log_id': log_id,
                                'period': monthV
                              }));
                          http.Response response1 = await http.post(
                              Uri.parse("http://10.100.15.123/atlas.php"),
                              body: ({
                                'Food': foodValue,
                              }));
                          if (response.statusCode == 200) {
                            // print(response.body.toString().characters.characterAt(1));
                            if (response.body.toString().characters.characterAt(2) != '{') {
                              List list = json.decode(response.body);
                              List foodRecords = [{"month":"Jan","weight": 0},{"month":"Feb","weight": 0},{"month":"Mar","weight": 0},{"month":"Apr","weight": 0},{"month":"May","weight": 0},{"month":"Jun","weight": 0},{"month":"Jul","weight": 0},{"month":"Aug","weight": 0},{"month":"Sep","weight": 0},{"month":"Oct","weight": 0},{"month":"Nov","weight": 0},{"month":"Dec","weight": 0}];
                              for(var i =0;i < list.length ;i++){
                                List mm = list[i]['date'].split('-');
                                foodRecords[int.parse(mm[1]) - 1]["weight"] += int.parse(list[i]['weight']);
                              }
                              if(noMonths != 12){
                                for(var i = currentMonth - noMonths;i <= currentMonth-1;i++){
                                  data.add(ProduceTimeline(
                                      months: foodRecords[i.toInt()]['month'],
                                      quantity: foodRecords[i.toInt()]['weight'],
                                      barColor: charts.ColorUtil.fromDartColor(Colors.green)));
                                  pieData  [foodRecords[i.toInt()]['month']] = foodRecords[i.toInt()]['weight'].toDouble();
                                }
                              }
                              else{
                                for(var i = 0 ;i <= noMonths-1;i++){
                                  data.add(ProduceTimeline(
                                      months: foodRecords[i.toInt()]['month'],
                                      quantity: foodRecords[i.toInt()]['weight'],
                                      barColor: charts.ColorUtil.fromDartColor(Colors.green)));
                                  pieData  [foodRecords[i.toInt()]['month']] = foodRecords[i.toInt()]['weight'].toDouble();
                                }
                              }


                              // for (var i = 0; i < foodRecords.length-1; i++) {
                              //   print("i value");
                              //   print(i);
                              //   print("list length");
                              //   print(foodRecords.length);
                              //           // pieData.addAll({list[i]['items']: double.parse(list[i]['weight'])
                              //   // pieData  [list[i]['items']] = double.parse(list[i]['weight']);
                              //   pieData  [foodRecords[i.toInt()]['month']] = foodRecords[i.toInt()]['weight'].toDouble();
                              //   print(pieData);
                              //  // });
                              // }
                              setState(() {});
                            }
                          }
                        },
                        child: const Text("Apply flitter")),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  child: InkWell(
                    onTap: () async {
                      http.Response response = await http.post(
                          Uri.parse("http://10.100.15.123/atlas.php"),
                          body: ({
                            'Food': foodValue.toString(),
                          }));
                      if (response.statusCode == 200) {
                        List foodData = json.decode(response.body);
                        Navigator.push(context, MaterialPageRoute(builder: (context) {return atlas_page(foodData);},),);
                      }
                    },
                    child: const Text(
                      "Food Information",
                      style: TextStyle(color: Colors.blue, fontSize: 17),
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
              ],
            ),
          ),
        ));
  }
}





// TODO Implement this library.





// TODO Implement this library.