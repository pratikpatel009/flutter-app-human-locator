import 'package:flutter/material.dart';
import 'package:location_tracking/config.dart';
import 'package:location_tracking/location_tracking.dart';
import 'package:location_tracking/pages/joinCircle.dart';
import 'package:location_tracking/pages/login_page.dart';
import 'package:location_tracking/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Config.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialRoute: SplashRoute,
      home: const LoginPage(),
      routes: routes,
    );
  }
}