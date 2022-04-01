//ignore_for_file: prefer_const_constructors
import 'package:harvest/produc.dart';
import 'package:flutter/material.dart';

class Vegetables extends StatefulWidget{

   const Vegetables({Key? key,required String title}) : super(key: key);

  @override
  _Vegetables createState() => _Vegetables();

}
class _Vegetables extends State<Vegetables>{

  @override
  Widget build(BuildContext context) {
    List<dynamic> vr=Products.vegetables;
    return ListView.builder(
        itemCount: vr.length,
        itemBuilder: (context, index){
          return Card(
            child:Padding(
              padding: const EdgeInsets.only(
                  top:(4)),
              child:  ListTile(
                title: Text(vr[index].name,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                ),
                trailing:Row( mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                    IconButton(onPressed: (){
                //Action to print

              }, icon:Icon(Icons.arrow_forward,size: 20,
                color: Colors.brown ,),

              )

              ]),
            ),

          ));
        }


    );

  }
}