import 'package:flutter/material.dart';

import './product_manager.dart';

//This notation is valid only if the method contain one line only
void main() => runApp(MyApp());

//stateless widget for static pages
//stateful widget for dynamic pages
//scaffold create new page in app
// _ => private access
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Menu El 3azim'),
            elevation: 10.0,
          ),
          body: ProductManager('Food Tester')),
    );
  }
}
