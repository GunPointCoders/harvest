import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_to_log.dart';

class createL extends StatefulWidget{

  const createL({Key? key}) : super(key: key);

  @override
  _createL createState() => _createL();
}

class _createL extends State<createL>{

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Log"),
      ),

      body: Padding(
      padding: EdgeInsets.only( top: /*MediaQuery.of(context).size.height * 0.15*/ 0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize : MainAxisSize.max,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                          hintText:"Enter Log Name"
                    ),
                  ),

                  SizedBox(height: 30),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(30),),
                      child: ElevatedButton(
                          onPressed: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context){return const NameOfThePage();},),);
                          },

                          child: const Text("SAVE")),
                    ),
                  ),//sizedbox

                  SizedBox(height: 30),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: 50,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(30),),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){return const Log();},),);
                            },
                            child: const Text("Add Items"),
                            style: ElevatedButton.styleFrom(primary: Colors.black26,textStyle: const TextStyle(color: Colors.black,fontSize: 20,))
                        )
                    ),
                  ),//sizedbox

                ],//children

              ),//Column


            ),//sizedbox

          ],//children

        ),//column

      ),//center

    ),//padding



    );
  }
}