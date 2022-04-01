//ignore_for_file: prefer_const_constructors

import 'package:harvest/produc.dart';
import 'package:flutter/material.dart';



class Fruits extends StatefulWidget{

  const Fruits({Key? key,required String title}) : super(key: key);

  @override
  _Fruits createState() => _Fruits();

}

class _Fruits extends State<Fruits>{

  @override
  Widget build(BuildContext context) {
  List<dynamic> fr=Products.fruits;

  return ListView.builder(
      itemCount: fr.length,
      itemBuilder: (context, index){
        return Card(
          child:Padding(
          padding: const EdgeInsets.only(
            top:(4)),

            child:  ListTile(
              title: Text(fr[index].name,
             style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900),



          ),

        trailing:Row( mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(onPressed: (){
            //action
        }, icon:Icon(Icons.arrow_forward,size: 20,
           color: Colors.brown ,),

          )

        ]


          ),
        ),

        ));
      }


  );

  }
}