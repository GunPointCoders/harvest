import 'dart:convert';

import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:harvest/Constant_Colors.dart';
import 'package:harvest/Deco_design.dart';
import 'package:harvest/HomePage.dart';
//import 'package:harvest/Product.dart';

import 'package:http/http.dart' as http;

// // ignore: camel_case_types
// class atlas_page extends StatefulWidget {
//   const atlas_page({Key? key}) : super(key: key);
//
//   @override
//   _atlas_page createState() => _atlas_page();
// }
//
// class _atlas_page extends State<atlas_page> {
// ignore: must_be_immutable, camel_case_types
class atlas_page extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  atlas_page(this.foodData );
  final List foodData;

  String foodValue='Select Food';

  var foodType = [
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

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  // List list = [{"Food":"Almond","Sow":"N/A","Plant":"Late Winter","Harvest":"Autumn","Sun":"Full Sun","pH":"Slightly Acidic to Neutral","picture":"10.100.15.123/foodpics/almond.jpeg"}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Atlas Page "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Form(
            key: _globalkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 90,),
                //in the sprint description there was a picture, I am not sure if they were made available to us.
                CircleAvatar(
                  radius: 120,
                 // backgroundImage: NetworkImage('http://10.100.15.123/foodpics/almond.jpeg'),
                  backgroundImage: NetworkImage("http://"+foodData[0]["picture"]),
                 // child: Image.network('http://10.100.15.123/foodpics/basil.jpeg'),
                ),
                const SizedBox(height: 150,),
                Center(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns:  const [
                          //table   columns for atlas
                          DataColumn(label: Text('Food')),
                          DataColumn(label: Text('Sow')),
                          DataColumn(label: Text('Plant')),
                          DataColumn(label: Text('Harvest')),
                          DataColumn(label: Text('Sun')),
                          DataColumn(label: Text('pH')),
                        ],
                        rows: foodData.map((e) => DataRow(cells: [
                          DataCell(Text(e['Food'],textScaleFactor: 1,)),
                         DataCell(Text(e['Sow'],textScaleFactor: 1,)),
                          DataCell(Text(e['Plant'],textScaleFactor: 1,)),
                          DataCell(Text(e['Harvest'],textScaleFactor: 1,)),
                          DataCell(Text(e['Sun'] ,textScaleFactor: 1,)),
                          DataCell(Text(e['pH'],))
                        ])).toList(),
                       //  DataRow(cells: [
                       // // [{"Food":"Almond","Sow":"N/A","Plant":"Late Winter","Harvest":"Autumn","Sun":"Full Sun","pH":"Slightly Acidic to Neutral","picture":"10.100.15.123/foodpics/almond.jpeg"}];
                       //    DataCell(Text("Almond")),
                       //    DataCell(Text("N/A")),
                       //    DataCell(Text("Late Winter")),
                       //    DataCell(Text('Autumn')),
                       //    DataCell(Text("Full Sun")),
                       //    DataCell(Text("Slightly Acidic to Neutral")),
                       //  ])).toList()

                      ))
                ),
                const SizedBox(width: 20,),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.green,
                    //link here the charts page
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: const BorderSide(color: Colors.green, width: 2)),
                    textColor: Colors.white,

                    child: const Text("Go to Charts"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

    TableRow buildRow(List<String> cells) => const TableRow(
        //children: cells.map((cell)) => Text
        );
  }

}
