import 'package:flutter/material.dart';
import 'package:fpbm/route_generator.dart';

void main() {
  runApp(MaterialApp(
    title: 'About the university',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}