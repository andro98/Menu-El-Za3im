import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

import './product_manager.dart';

//This notation is valid only if the method contain one line only
void main() {
  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = true;
  //debugPaintPointersEnabled = true;
  runApp(MyApp());
}

//final => doesn't not change the reference in memory, cannot assign new value, but can add
//const =>
//stateless widget for static pages
//stateful widget for dynamic pages
//scaffold create new page in app
// _ => private access
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    //debugShowMaterialGrid: true,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Menu El 3azim'),
            elevation: 10.0,
          ),
          body: ProductManager()),
    );
  }
}
