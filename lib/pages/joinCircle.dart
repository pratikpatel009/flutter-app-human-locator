import 'package:flutter/material.dart';

class JoinCircle extends StatefulWidget {
  const JoinCircle({Key? key}) : super(key: key);

  @override
  State<JoinCircle> createState() => _JoinCircleState();
}

class _JoinCircleState extends State<JoinCircle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Join Circle'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    );
  }
}

