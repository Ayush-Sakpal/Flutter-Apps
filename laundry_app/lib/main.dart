import 'package:flutter/material.dart';
import 'package:laundry_app/homeScreen.dart';

void main() {
  runApp(const MyApp());
  List itemList = [];
  List qtyList = [];
  List priceList = [];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Homescreen()
    );
  }
}
