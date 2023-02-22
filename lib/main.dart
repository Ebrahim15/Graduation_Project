import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/layout/app_layout/app_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppLayout(),
    );
  }
}


