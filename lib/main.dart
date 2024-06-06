// main.dart

import 'package:flutter/material.dart';

import 'ContactListScreen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List App',
        theme: ThemeData(primarySwatch: Colors.green),
        darkTheme: ThemeData(primarySwatch: Colors.blue),
        color: Colors.black,
        debugShowCheckedModeBanner: false,
        home: const Contactlistscreen()
    );
  }
}
