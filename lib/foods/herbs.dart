//ignore_for_file: prefer_const_constructors
import 'package:harvest/produc.dart';
import 'package:flutter/material.dart';

class Herbs extends StatefulWidget{

  const Herbs({Key? key,required String title}) : super(key: key);

  @override
  _Herbs createState() => _Herbs();

}
class _Herbs extends State<Herbs>{

  @override
  Widget build(BuildContext context) {
    List<dynamic> h=Products.herbs;
    return ListView.builder(
        itemCount: h.length,
        itemBuilder: (context, index){
          return Card(
            child:Padding(
              padding: const EdgeInsets.only(
                  top:(4)),
              child:  ListTile(
                title: Text(h[index].name,
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