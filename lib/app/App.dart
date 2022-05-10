import 'package:flutter/cupertino.dart';

class MyApp extends StatefulWidget{

  /// This is Used to make Only singleton For MyAppClass

  MyApp._singleInstance();

  static final MyApp _instance =  MyApp._singleInstance();


  factory MyApp()=> _instance;




  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}