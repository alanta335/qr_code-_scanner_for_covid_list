import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'mreader.dart';

class Page2Screen extends StatefulWidget {
  final data;
  Page2Screen({@required this.data});
  @override
  _Page2ScreenState createState() => _Page2ScreenState(storeid: data);
}

class _Page2ScreenState extends State<Page2Screen> {
  var storeid;
  _Page2ScreenState({@required this.storeid});
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page 2'),
      ),
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              Center(
                child: Text('data is $storeid'),
              ),
              ElevatedButton(
                onPressed: () async {
                  DocumentSnapshot user = await FirebaseFirestore.instance
                      .collection('USERS')
                      .doc('${FirebaseAuth.instance.currentUser!.uid}')
                      .get();
                  DocumentSnapshot store = await FirebaseFirestore.instance
                      .collection('USERS')
                      .doc('$storeid')
                      .get();
                  FirebaseFirestore.instance
                      .collection('USERS')
                      .doc('${FirebaseAuth.instance.currentUser!.uid}')
                      .collection('visited')
                      .doc()
                      .set({
                    'name': store['name'],
                    'address': store['addres'],
                    'phno': store['pno'],
                    'visitedId': store['userId'],
                    'time': DateTime.now().toString(),
                  });
                  print(store['name']);
                  print(user['name']);
                  FirebaseFirestore.instance
                      .collection('USERS')
                      .doc('$storeid')
                      .collection('visited')
                      .doc()
                      .set({
                    'name': user['name'],
                    'address': user['addres'],
                    'phno': user['pno'],
                    'visitedId': user['userId'],
                    'time': DateTime.now().toString(),
                  });
                },
                child: Text('add data'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserInformation()));
                  },
                  child: Text('see the visited place'))
            ],
          ),
        ),
      ),
    );
  }
}
