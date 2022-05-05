import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: const Text("Flutter"),
           elevation: 0,
           actions: [
             IconButton(
               onPressed: () async {
                 SharedPreferences prefs = await SharedPreferences.getInstance();
                 prefs.remove('token');
                 Navigator.pushNamedAndRemoveUntil(
                   context,
                   '/login',
                   (route) => false,
                 );
               },
               icon: const Icon(Icons.logout),
               color: Colors.black,
             )
           ],
         ),
         backgroundColor: Colors.grey[200],
         body: const Center(
           child: Text("Login Successful"),
         ),
       );
  }
}
