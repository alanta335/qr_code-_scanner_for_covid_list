import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'drawer.dart';

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
              ElevatedButton(onPressed: () async {}, child: Text("search")),
              Container(
                  child: StreamBuilder<QuerySnapshot>(
                stream: users.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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
                            child: SpinKitRing(
                                color: Colors.deepPurple.shade400, size: 100)),
                      ),
                    );
                  }

                  return Scaffold(
                    drawer: new CmnDrawer(),
                    appBar: AppBar(
                      title: Text('Visited Database'),
                    ),
                    body: ListView(
                      addAutomaticKeepAlives: false,
                      cacheExtent: 300,
                      reverse: false,
                      //physics: ,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        return Card(
                          child: ListTile(
                            onLongPress: () async {
                              DocumentSnapshot patiant = await FirebaseFirestore
                                  .instance
                                  .collection('USERS')
                                  .doc(
                                      '${document.get('visitedId').toString()}')
                                  .collection('reading')
                                  .doc('${document.get('time').toString()}')
                                  .get();
                              print(
                                  '${document.get('visitedId').toString()}---------------${document.get('time').toString().substring(0, 16)}++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PRecord(
                                    data: patiant,
                                  ),
                                ),
                              );
                            },
                            title: Text('${document.get('name')}'),
                            subtitle: Text(
                                'Address : ${document.get('address')}\nVisited on ${document.get('time')}'),
                            trailing: Text(
                                'Phone Number:${document.get('phno')}\nVaccination status: ${document.get('vaccination_status')}'),
                            isThreeLine: true,
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
