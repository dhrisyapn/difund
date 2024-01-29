import 'package:difund/donate.dart';
import 'package:difund/forgot.dart';
import 'package:difund/login.dart';
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
      title: 'DiFUND',
      theme: ThemeData(
       
        useMaterial3: true,
      
      ),
    debugShowCheckedModeBanner: false,
    home: DonatePage(),
    );
  }
}

