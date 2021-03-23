import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final double appBarHeight = 65.0;

  @override
  get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Jadwal Praktikum'),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}