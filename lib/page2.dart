import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // new
import 'package:firebase_auth/firebase_auth.dart';

class Page2Screen extends StatefulWidget {
  final data;
  Page2Screen({@required this.data});
  @override
  _Page2ScreenState createState() => _Page2ScreenState(storeid: data);
}

class _Page2ScreenState extends State<Page2Screen> {
  var storeid;
  _Page2ScreenState({@required this.storeid});
  TextEditingController usernameController = TextEditingController();
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
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'enter your password here',
                  labelText: 'password',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
              ),
              ElevatedButton(
                onPressed: () async {
                  FirebaseFirestore.instance.collection('visited').add({
                    'text': usernameController.text,
                    'timestamp': DateTime.now().millisecondsSinceEpoch,
                    'name': FirebaseAuth.instance.currentUser!.displayName,
                    'userId': FirebaseAuth.instance.currentUser!.uid,
                  });
                },
                child: Text('add data'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
