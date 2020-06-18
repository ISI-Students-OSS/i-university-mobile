import 'package:flutter/material.dart';
import 'package:fpbm/route_generator.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}