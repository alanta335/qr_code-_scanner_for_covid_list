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
    CollectionReference users = FirebaseFirestore.instance
        .collection('USERS')
        .doc('${FirebaseAuth.instance.currentUser!.uid}')
        .collection('visited');
    //.collection('visited');
    print(FirebaseAuth.instance.currentUser!.uid);
    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Visited DATABASE'),
          ),
          body: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return Expanded(
                child: Card(
                  child: ListTile(
                    title: Text(
                        '${document.get('name')}   ${document.get('phno')}'),
                    subtitle: Text(
                        '${document.get('address')}   ${document.get('time')}'),
                    isThreeLine: true,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
