import 'dart:convert';
import 'package:apipractice/view/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'homepage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      home:  UserDetailsScreen(),
    );
  }

  /// MVC model view controller
/// model view controller
/// MVP model view presenter
/// MVVM model view viewmodel

}

