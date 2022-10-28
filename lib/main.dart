import 'package:flutter/material.dart'; 
import 'data_model.dart'; 
import 'package:http/http.dart' as http; 
import 'dart:async'; 
//import 'package:flutter/services.dart'; 
 
void main() { 
  runApp(MyApp()); 
} 
 
class MyApp extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'HTTP POST', 
      theme: ThemeData( 
        primarySwatch: Colors.blue, 
      ), 
      home: MyHomePage(title: 'Http Post Method'), 
    ); 
  } 
} 
 
class MyHomePage extends StatefulWidget { 
  MyHomePage({Key? key, required this.title}) : super(key: key); 
 
  final String title; 
 
  @override 
  _MyHomePageState createState() => _MyHomePageState(); 
} 
 
Future<DataModel?> submitData(String name, String job) async { 
  //try{ 
  String apiUrl = "https://reqres.in/api/users"; 

  final response = await http.post(Uri.parse(apiUrl), body: {"name": name, "job": job}); 
  var data = response.body; 
  print(data); 
 
  if (response.statusCode == 201) { 
    String responseString = response.body; 
    return dataModelFromJson(responseString); 
  } else { 
    return null; 
  } 
} 
 
class _MyHomePageState extends State<MyHomePage> { 
  DataModel? _dataModel; 
  TextEditingController nameController = TextEditingController(); 
  TextEditingController jobController = TextEditingController(); 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        centerTitle: true, 
        title: Text(widget.title), 
      ), 
      body: Container( 
        padding: EdgeInsets.all(20), 
        child: SingleChildScrollView( 
          child: Column( 
            children: [ 
              TextField( 
                decoration: InputDecoration( 
                    border: OutlineInputBorder(), hintText: 'Enter'), 
                controller: nameController, 
              ), 
              SizedBox(height: 10), 
              TextField( 
                decoration: InputDecoration( 
                    border: OutlineInputBorder(), 
                    hintText: 'Enter Job Title here'), 
                controller: jobController, 
              ), 
              SizedBox(height: 10), 
              ElevatedButton( 
                  onPressed: () async { 
                    final String name = nameController.text; 
                    final String job = jobController.text; 
                    //DataModel data = await submitData(name, job); 
                    final DataModel? data = await submitData(name, job); 
                    setState(() { 
                      _dataModel = data; 
                    }); 
                  }, 
                  child: Text("Submit")) 
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
}
