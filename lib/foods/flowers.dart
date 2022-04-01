//ignore_for_file: prefer_const_constructors
import 'package:harvest/produc.dart';
import 'package:flutter/material.dart';

class Flowers extends StatefulWidget{

  const Flowers({Key? key,required String title}) : super(key: key);

  @override
  _Flowers createState() => _Flowers();

}
class _Flowers extends State<Flowers>{

  @override
  Widget build(BuildContext context) {
    List<dynamic> f=Products.flowers;
    return ListView.builder(
        itemCount: f.length,
        itemBuilder: (context, index){
          return Card(
            child:Padding(
              padding: const EdgeInsets.only(
                  top:(4)),
              child:  ListTile(
                title: Text(f[index].name,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                ),

                trailing:Row( mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                    IconButton(onPressed: (){
                //action
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