import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'main.dart';
import 'mreader.dart';

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  String qrData = FirebaseAuth.instance.currentUser!
      .uid; // already generated qr code when the page opens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
        actions: <Widget>[],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImage(
              //plce where the QR Image will be shown
              data: qrData,
            ),
            Text(
              "id is $qrData",
              style: TextStyle(fontSize: 20.0),
            ),
            Center(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserInformation()));
                    },
                    child: Text('visited person data'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChoosingPage()));
                      },
                      child: Text('LOG OUT')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
