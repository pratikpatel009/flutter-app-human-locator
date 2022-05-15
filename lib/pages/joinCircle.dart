import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location_tracking/config.dart';
import 'package:location_tracking/location_tracking.dart';
import 'package:location_tracking/services/remote_service.dart';
import 'package:http/http.dart' as http;

class JoinCircle extends StatefulWidget {
  const JoinCircle({Key? key}) : super(key: key);

  @override
  State<JoinCircle> createState() => _JoinCircleState();
}

class _JoinCircleState extends State<JoinCircle> {

  // List<JoinCircle>? joinCircle;
  // var isLoaded = false;
  var data;
  Future<void> getMember() async {
    var url = Uri.parse(Config.getMemberAPI);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  void initState() {
    super.initState();

    // fatech data from api

    // getData();
  }

  // getData() async {
  //   joinCircle = (await RemoteService().getMember()) as List<JoinCircle>?;
  //
  //   if (joinCircle != null) {
  //     setState(() {
  //       isLoaded = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('My Circle'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      // body: Visibility(
      //   visible: isLoaded,
      //   child:
      body: FutureBuilder(
        future: getMember(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children:  [
                       ReusebleRow(title: data["mycircles"][index]["username"].toString()),
                       // ReusebleRow(title: data['mycircles']['username'].toString())
                      ],
                    ),
                  );
                });
          }
        },
      ),
      //replacement: const Center(child: CircularProgressIndicator(),),
      // ),
    );
  }
}

class ReusebleRow extends StatelessWidget {

   ReusebleRow({Key? key, required this.title}) : super(key: key);
  String title;
   


  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
        ],
      ),
    );
  }
}


// return Padding(
// padding: const EdgeInsets.all(8.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(title!),
// ],
// ),
// );