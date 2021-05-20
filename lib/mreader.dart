import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'about_us.dart';
import 'main.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
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
    Query users = FirebaseFirestore.instance
        .collection('USERS')
        .doc('${FirebaseAuth.instance.currentUser!.uid}')
        .collection('visited')
        .orderBy('time', descending: true);
    //.collection('visited');
    print(FirebaseAuth.instance.currentUser!.uid);
    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          Alert(
                  context: context,
                  closeFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserInformation()));
                  },
                  title: "Error!",
                  style: alertStyle,
                  desc: "Failed to load data. Try again!")
              .show();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                  child: SpinKitRing(color: Colors.blueAccent, size: 100)),
            ),
          );
        }

        return Scaffold(
          drawer: Drawer(
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
                        title: Text('About Us'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUs()));
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
                        title: Text('About App'),
                        onTap: () {
                          Navigator.pop(context);
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChoosingPage()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: Text('Visited DATABASE'),
          ),
          body: ListView(
            addAutomaticKeepAlives: false,
            cacheExtent: 300,
            reverse: false,
            //physics: ,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return Card(
                child: ListTile(
                  title: Text('${document.get('name')}'),
                  subtitle: Text(
                      'Address : ${document.get('address')}\nVisited on ${document.get('time')}'),
                  trailing: Text('Phone Number:${document.get('phno')}'),
                  isThreeLine: true,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
