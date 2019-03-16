import 'package:flutter/material.dart';
import 'package:profe_app/routes.dart';

void main() => runApp(MyApp());
var apiKey = "AIzaSyDMaLDcKZ9XSR07dOED9VQo0Sx8XtOTcXU";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Fire',
      theme: ThemeData(
//        primarySwatch: Colors.red,
      ),
      routes: routes,
    );
  }
}