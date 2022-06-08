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
<<<<<<< HEAD

 // String ? food, sowtime, planttime, name, email, phone, harvesttime, sun, pH;
=======
  String? food, sowtime, planttime, name, email, phone, harvesttime, sun, pH;
  String foodValue = 'Select Food';
>>>>>>> 3d30a0724121359acc2dd06e76d385cf0ef48765

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
<<<<<<< HEAD
          backgroundColor: Colors.green,
          title: const Text("Atlas Page "),
=======
        backgroundColor: Colors.green,
        title: const Text("Atlas Page "),
        // actions: [
        //   IconButton(
        //       icon: const Icon(Icons.search),
        //       onPressed: () {
        //         //showSearch(context: context, delegate: CustomSearch());
        //
        //       })
        // ]
>>>>>>> 3d30a0724121359acc2dd06e76d385cf0ef48765
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Form(
            key: _globalkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
<<<<<<< HEAD
                const SizedBox(height: 90,),
                //in the sprint description there was a picture, I am not sure if they were made available to us.
                CircleAvatar(
                  radius: 120,
                 // backgroundImage: NetworkImage('http://10.100.15.123/foodpics/almond.jpeg'),
                  backgroundImage: NetworkImage("http://"+foodData[0]["picture"]),
                 // child: Image.network('http://10.100.15.123/foodpics/basil.jpeg'),
                ),
                const SizedBox(height: 150,),
=======
                CustomSearchableDropDown(
                  dropdownHintText: 'Search For food type ',
                  showLabelInMenu: true,
                  primaryColor: Colors.red,
                  menuMode: true,
                  labelStyle: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                  items: foodType,
                  label: 'Select food type',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Icon(Icons.search),
                  ),
                  dropDownMenuItems: foodType?.map((item) {
                        return item;
                      })?.toList() ??
                      [],
                  onChanged: (value) async {
                    if (value != null) {
                      // setState(() async {
                      foodValue = value;
                      http.Response response = await http.post(
                          Uri.parse("http://10.100.15.123/atlas.php"),
                          body: ({
                            'Food': foodValue,
                          }));
                      if (response.statusCode == 200) {
                        list = json.decode(response.body);
                        print(list);
                      }
                      ;
                      // }

                    } else {
                      print(null);
                    }
                  },
                ),
                SizedBox(
                  height: 100,
                ),
                //in the sprint description there was a picture, I am not sure if they were made available to us.
                CircleAvatar(
                  radius: 100,
                  // child: Text("FOOD PICTURE"),
                  child:
                      Image.network('http://10.100.15.123/foodpics/basil.jpeg'),
                ),
                SizedBox(
                  height: 150,
                ),
>>>>>>> 3d30a0724121359acc2dd06e76d385cf0ef48765
                Center(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
<<<<<<< HEAD
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

                      )),
=======
                          columns: const [
                            //table   columns for atlas
                            DataColumn(label: Text('Food')),
                            DataColumn(label: Text('Sow')),
                            DataColumn(label: Text('Plant')),
                            DataColumn(label: Text('Harvest')),
                            DataColumn(label: Text('Sun')),
                            DataColumn(label: Text('pH')),
                          ],
                          rows: list!
                              .map((e) =>
                                  //information displaced deending on food selected
                                  DataRow(cells: [
                                    DataCell(Text(e['Food'])),
                                    DataCell(Text(e['Sow'])),
                                    DataCell(Text(e['Plant'])),
                                    DataCell(Text(e['HArvest'])),
                                    DataCell(Text(e['Sun'])),
                                    DataCell(Text(e['pH'])),
                                  ]))
                              .toList())),
>>>>>>> 3d30a0724121359acc2dd06e76d385cf0ef48765
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

// class CustomSearch extends SearchDelegate {
//   List<String> allData = [
//     'Almond',
//     'Apple (Golden Delicious)',
//     'Apple (Granny Smith)',
//     'Artichoke',
//     'Aubergine',
//     'Basil',
//     'Bean (Broad)',
//     'Bean (Flat)',
//     'Bean (Green)',
//     'Bean (Yellow)',
//     'Bean (Black)',
//     'Bean (Black-Eyed)',
//     'Bean (Purple)',
//     'Beetroot',
//     'Blackberry',
//     'Blueberry',
//     'Broccoli',
//     'Butternut Squash',
//     'Cabbage (Chinese)',
//     'Cabbage (Purple)',
//     'Carrot',
//     'Cauliflower',
//     'Cavolo Nero',
//     'Celery',
//     'Chilli (Birdseye)',
//     'Chilli (Serrano)',
//     'Chive',
//     'Coriander',
//     'Cucumber',
//     'Curry Leaf',
//     'Edible Flower',
//     'Fennel',
//     'Fig (Green)',
//     'Fig (Purple)',
//     'Gem Squash',
//     'Ginger',
//     'Gooseberry',
//     'Granadilla',
//     'Grape (Catawba)',
//     'Grape (Hanepoot)',
//     'Grape (Victoria)',
//     'Grapefruit (Ruby)',
//     'Jerusalem Artichoke',
//     'Kale',
//     'Kei Apple',
//     'Leek',
//     'Lemon',
//     'Lemon Balm',
//     'Lemon Verbena',
//     'Lettuce',
//     'Lime',
//     'Marjoram',
//     'Mint',
//     'Mustard Leaf',
//     'Naartjie',
//     'Nasturtium',
//     'Onion (Red)',
//     'Onion (White)',
//     'Orange (Cara Cara)',
//     'Orange (Valencia)',
//     'Oregano',
//     'Parsley',
//     'Pea',
//     'Peach (White)',
//     'Peach (Yellow)',
//     'Pepper (Green California Wonder)',
//     'Pepper (Red Santorini)',
//     'Plum (Yellow)',
//     'Plum (Red)',
//     'Plum (Purple)',
//     'Plum (Purple Leaf)',
//     'Pumpkin (Boerpampoen)',
//     'Pumpkin (Queensland Blue)',
//     'Radish',
//     'Rhubarb',
//     'Rosemary',
//     'Sage',
//     'Shallot',
//     'Sorrel',
//     'Spinach',
//     'Strawberry',
//     'Sunflower Seed',
//     'Sweet Potato (White)',
//     'Sweet Potato (Orange)',
//     'Thyme',
//     'Tomato (Cherry)',
//     'Tomato (Costoluto)',
//     'Tomato (Floradade)',
//     'Tomato (Moneymaker)',
//     'Tomato (St. Pierre)',
//     'Tomato (Yellow Baby)',
//     'Turmeric',
//     'Turnip',
//     'Zucchini (Green)];'
//   ];
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           icon: const Icon(Icons.clear),
//           onPressed: () {
//             query = '';
//           })
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         icon: const Icon(Icons.arrow_back_ios_new),
//         onPressed: () {
//           close(context, null);
//         });
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var item in allData) {
//       if (item.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(item);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuery.length,
//         itemBuilder: (context, index) {
//           var result = matchQuery[index];
//           return ListTile(
//             title: Text(result),
//           );
//         });
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var item in allData) {
//       if (item.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(item);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuery.length,
//         itemBuilder: (context, index) {
//           var result = matchQuery[index];
//           return ListTile(
//             title: RichText(
//               text: TextSpan(
//                   text: allData[index].substring(0, query.length),
//                   style: const TextStyle(
//                       color: Colors.green, fontWeight: FontWeight.bold),
//                   children: [
//                     TextSpan(
//                         text: allData[index].substring(query.length),
//                         style: const TextStyle(color: Colors.grey))
//                   ]),
//             ),
//           );
//
//           ItemCount:
//           allData.length;
//         });
//   }
// }
