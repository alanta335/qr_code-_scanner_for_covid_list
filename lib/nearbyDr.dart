import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'drawer.dart';
import 'mreader.dart';
import 'nearbydoc.dart';

class Nearby extends StatefulWidget {
  const Nearby({Key? key}) : super(key: key);

  @override
  _NearbyState createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var alertStyle = AlertStyle(
      descTextAlign: TextAlign.center,
      descStyle: TextStyle(
        fontSize: 16,
      ),
      titleStyle: TextStyle(fontSize: 25),
      animationType: AnimationType.grow,
      animationDuration: Duration(milliseconds: 400),
    );
    Query users = FirebaseFirestore.instance.collection('USERS');

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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: pinController,
                  decoration: InputDecoration(
                    hintText: 'Enter  pincode to search',
                    labelText: 'pincode',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Doctorlist(pincode: pinController.text)));
                    print('${pinController.text}----------');
                  },
                  child: Text("search")),
            ],
          ),
        ),
      ),
    );
  }
}
