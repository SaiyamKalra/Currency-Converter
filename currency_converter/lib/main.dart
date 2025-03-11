import 'package:currency_converter/currency_converter_material_page.dart';
import 'package:flutter/material.dart';
//we are importing a flutter package material.dart where we got runApp function

void main() {
  // Widgets explain how the flutter app should look
  //like what should be visible to the user using the app

  runApp(const MyApp()); //first text visible after running the app
}

//Material App-Makes the app look like a real app
//Types of Widgets for UI
// 1. StatelessWidget does not allow the state to be changed
// 2. StatefulWidget allows the state to be changed

// State- Data which tells how a app should look like

// Types of Design
//1.Material Design
//2.Cupertino design

class MyApp extends StatelessWidget {
  //first text visible class
  const MyApp({super.key}); //  (??) key class differentiates between widgets
  @override
  Widget build(BuildContext context) {
    //Tells location of the widget
    return const MaterialApp(
      //we can only navigate in app after using material app function
      home: CurrencyConverterMaterialPage(),
    );
  }
}
