import 'package:estoque/home/home.dart';
import 'package:flutter/material.dart';



void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Color.fromARGB(255, 28, 103, 214)
      ),
      debugShowCheckedModeBanner: false,
        home: const Home(),
    );
  }
}
