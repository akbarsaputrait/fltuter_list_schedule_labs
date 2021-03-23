import 'package:flutter/material.dart';

// UI
import 'package:flutter_app/ui/AppBar.dart';
import 'package:flutter_app/ui/Body.dart';

void main() {
  runApp(MyApp());
}

// App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Color(0xFFFF5B16),
            accentColor: Color(0xFFA0A0A0),
            fontFamily: 'Mulish'),
        home: Scaffold(
          appBar: MyAppBar(),
          body: BodyApp(),
          backgroundColor: Color(0xFFF5F6F8),
        ));
  }
}
