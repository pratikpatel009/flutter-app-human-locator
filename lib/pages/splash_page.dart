import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location_tracking/routes.dart';
import 'package:location_tracking/services/shared_services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

   final SharedServises _sharedServices = SharedServises();

  @override
  void initState() {
    _sharedServices.checkLogedIn("token").then((value) {
      if (value != null) {
        return Timer(const Duration(seconds: 2),
                () => Navigator.of(context).pushNamed(LocationtackerRoute));
      } else {
        return Timer(const Duration(seconds: 2),
                () => Navigator.of(context).pushNamed(LoginRoute));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Icon(
            Icons.app_blocking,
          )),
    );
  }
}