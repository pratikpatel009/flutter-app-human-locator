import 'package:flutter/material.dart';

class MyCircle extends StatefulWidget {
  const MyCircle({Key? key}) : super(key: key);

  @override
  State<MyCircle> createState() => _MyCircleState();
}

class _MyCircleState extends State<MyCircle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('My Circle'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    );
  }
}
