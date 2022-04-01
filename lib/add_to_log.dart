//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'foods/fruits.dart';
import 'foods/flowers.dart';
import 'package:harvest/foods/herbs.dart';
import 'vegetables.dart';

List<bool> isSelected=List.generate(4, (_) => false);

class Log extends StatefulWidget{

   const Log({Key? key}) : super(key: key);

  @override
  _Log createState() => _Log();
}

class _Log extends State<Log> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController=TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Add Harvest To Log"),
      ),

  backgroundColor: Colors.blueGrey,

         body: Column(
             children:<Widget>[
         DefaultTabController(
           length: 4,
            child: Column(
                children: const <Widget>[
                  TabBar(
                      tabs: [
                        Tab(text: ("Fruits"),
                        ),
                        Tab(text:("Vegetables"),
                        ),
                        Tab(text: ("Flowers"),
                        ),

                        Tab( text:"Herbs",
                        ),
                      ],
                  )
                ],),
          ),

           Expanded(
               child: TabBarView(controller: tabController,
               children:const <Widget>[
               Fruits(
                 title: '',
               ),
               Flowers(
                 title: '',
               ),
                 Vegetables(
                   title:'',
                 ),

                 Herbs(
                   title:'',
                 ),

               ],
               ),

           )]
           ),

    );
  }
}
