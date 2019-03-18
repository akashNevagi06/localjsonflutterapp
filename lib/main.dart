import 'package:flutter/material.dart';
import 'dart:convert';


void main() => runApp(new MaterialApp(
   theme: ThemeData(
      primarySwatch: Colors.teal,
   ),
   home:HomePage(),
));

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => new HomePageState();

}

class HomePageState extends State<HomePage>{
  List data;
  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(
          title: Text("Load Json App"),
       ),
        body: Container(
           child: Center(
              child: FutureBuilder(
                 future: DefaultAssetBundle.of(context).loadString('load_json/person.json'),
                  builder: (context,snapshot){
                    // Decode Json
                    var mydata = json.decode( snapshot.data.toString());
                    return new ListView.builder(
                      
                       itemBuilder: (BuildContext context, int index){
                         return Card(
                            child: Column(
                               crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                 new Text("Name: "+mydata[index]['name']),
                                 new Text("Age:" +mydata[index]['age']),
                                 new Text("Height:" +mydata[index]['height']),
                                new Text("Gender:"+mydata[index]['gender']),
                                new Text("Hair_color:"+mydata[index]['hair_color']),
                                ],
                            ),

                         );
                         
                         },
                          
                        
                    );
                  },
              ),
           ),
        ),
    );
    }
}
