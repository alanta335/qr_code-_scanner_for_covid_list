import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'screenscaling.dart';
import 'about_us.dart';
import 'main.dart';
import 'userprofile.dart';

import 'package:flutter/material.dart';

class CmnDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
            radius: 2.3,
            center: Alignment.topLeft,
            colors: <Color>[
              Color(0xF19616EC),
              Color(0xC99B3DA3),
            ]),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100,
            child: DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.mirror,
                      colors: <Color>[
                        Color(0xFF6C1B9B),
                        Color(0xFF46384E),
                      ]),
                ),
                child: Center(
                  child: Text(
                    "CoViQrR",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        fontStyle: FontStyle.italic),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              margin: EdgeInsets.only(right: 130),
              shadowColor: Color(0xFF501474),
              color: Colors.transparent,
              child: ListTile(
                title: Text('My Profile'),
                onTap: () async {
                  DocumentSnapshot user = await FirebaseFirestore.instance
                      .collection('USERS')
                      .doc('${FirebaseAuth.instance.currentUser!.uid}')
                      .get();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserProfile(
                                name: user['name'],
                                email: user['email'],
                                pno: user['pno'],
                                addres: user['addres'],
                              )));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              margin: EdgeInsets.only(right: 100),
              shadowColor: Color(0xFF501474),
              color: Colors.transparent,
              child: ListTile(
                title: Text('Visited Data'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              margin: EdgeInsets.only(right: 70),
              shadowColor: Color(0xFF501474),
              color: Colors.transparent,
              child: ListTile(
                title: Text('Help'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              margin: EdgeInsets.only(right: 40),
              shadowColor: Color(0xFF501474),
              color: Colors.transparent,
              child: ListTile(
                title: Text('About Developers'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              margin: EdgeInsets.only(right: 10),
              shadowColor: Color(0xFF501474),
              color: Colors.transparent,
              child: ListTile(
                title: Text('Log out'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChoosingPage()));
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
