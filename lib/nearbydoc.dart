import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'drawer.dart';
import 'mreader.dart';

class Doctorlist extends StatefulWidget {
  //const doctorlist({Key? key}) : super(key: key);
  final pincode;
  const Doctorlist({required this.pincode});
  @override
  _DoctorlistState createState() => _DoctorlistState(pincode: pincode);
}

class _DoctorlistState extends State<Doctorlist> {
  final pincode;
  _DoctorlistState({@required this.pincode});

  @override
  Widget build(BuildContext context) {
    Query users = FirebaseFirestore.instance.collection('USERS');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          Alert(
                  context: context,
                  closeFunction: () async {
                    DocumentSnapshot user = await FirebaseFirestore.instance
                        .collection('USERS')
                        .doc('${FirebaseAuth.instance.currentUser!.uid}')
                        .get();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UserInformation(type: user['user_type'])));
                  },
                  title: "Error!",
                  //style: alertStyle,
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
            title: Text('Nearby Doctor'),
          ),
          body: ListView(
            addAutomaticKeepAlives: false,
            cacheExtent: 300,
            reverse: false,
            //physics: ,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              if ((document.get('pincode').toString().compareTo(pincode) ==
                      0) &&
                  (document.get('user_type') == true)) {
                return Card(
                  child: ListTile(
                    onLongPress: () {
                      _callNumber(document.get('pno'));
                    },
                    title: Text('${document.get('name')}'),
                    subtitle: Text('Address : ${document.get('addres')}}'),
                    trailing: Text(
                        'Phone Number:${document.get('pno')}\nFully vaccinated : ${document.get('vaccination_status')}'),
                    isThreeLine: true,
                  ),
                );
              }
              return Container();
            }).toList(),
          ),
        );
      },
    );
  }

  _callNumber(String telno) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(telno);
  }
}
