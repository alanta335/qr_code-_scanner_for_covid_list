import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
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
          return Scaffold(
            body: Center(
              child: SafeArea(
                child: Text('something is wrong'),
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: SafeArea(
              child: Text('LOADING'),
            ),
          );
        }

        return Scaffold(
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
