import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class VisitedData extends StatefulWidget {
  @override
  _VisitedDataState createState() => _VisitedDataState();
}

class _VisitedDataState extends State<VisitedData> {
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
              ElevatedButton(
                onPressed: () async {},
                child: Text('add data'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  List a = [];
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('visited');

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
          body: new ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return new ListTile(
                title: new Text(document.data().toString()),
                subtitle: new Text(document.data().toString()),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
