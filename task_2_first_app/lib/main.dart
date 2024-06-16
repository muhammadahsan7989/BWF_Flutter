import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Center(child: Text("TASK 2")),
      ),
      body: Container(
        child:const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("muhammad ahsan",style: TextStyle(color: Colors.black,fontSize: 20,fontStyle: FontStyle.italic),),
            ],
          ),
        ),
      ),
      
    ),
    );

        
    }
}
