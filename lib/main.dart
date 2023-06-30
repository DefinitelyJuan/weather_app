import 'package:flutter/material.dart';
import 'package:weather_app/loading_screen.dart';
import 'package:weather_app/location_screen.dart';
import 'city_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/city_screen":(context) => CityScreen(),
      },
      title: 'Material App Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Material App Bar")),
        body: LoadingScreen(),
      ),
    );
  }
}

