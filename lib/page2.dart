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
              TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: 'enter any message if there is',
                  labelText: 'data',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
              ),
              ElevatedButton(
                onPressed: () async {
                  FirebaseFirestore.instance.collection('$storeid').add({
                    'message': messageController.text,
                    'timestamp': DateTime.now().toString(),
                    'userId': FirebaseAuth.instance.currentUser!.uid,
                  });
                  FirebaseFirestore.instance
                      .collection('${FirebaseAuth.instance.currentUser!.uid}')
                      .add({
                    'timestamp': DateTime.now().toString(),
                    'visited_shop_id': storeid,
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
