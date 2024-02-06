import 'package:difund/authpage.dart';
import 'package:difund/donate.dart';
import 'package:difund/firebase_options.dart';
import 'package:difund/forgot.dart';
import 'package:difund/login.dart';
import 'package:difund/org.dart';
import 'package:difund/payment.dart';
import 'package:difund/profile.dart';
import 'package:difund/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: AuthPage(),
    );
  }
}
