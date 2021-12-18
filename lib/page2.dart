import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'drawer.dart';
import 'screenscaling.dart';

import 'mreader.dart';

class Page2Screen extends StatefulWidget {
  final data, data2;
  Page2Screen({@required this.data, @required this.data2});
  @override
  _Page2ScreenState createState() => _Page2ScreenState(pid: data, x1: data2);
}

class _Page2ScreenState extends State<Page2Screen> {
  var pid;
  DocumentSnapshot? x1;
  _Page2ScreenState({@required this.pid, @required this.x1});
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CmnDrawer(),
      appBar: AppBar(
        title: Text('patiant Details'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Store Name: ${x1!['name']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  "Phone Number: ${x1!['pno']}",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  "Email ID: ${x1!['email']}",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  "Location: ${x1!['addres']}",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  "vaccinated: ${x1!['vaccination_status']}",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  DocumentSnapshot user = await FirebaseFirestore.instance
                      .collection('USERS')
                      .doc('${FirebaseAuth.instance.currentUser!.uid}')
                      .get();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              UserInformation(type: user['user_type'])));
                },
                child: Text("see medical records"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
