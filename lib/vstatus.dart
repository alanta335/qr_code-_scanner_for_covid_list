import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'screenscaling.dart';

class VaccinationStatus extends StatefulWidget {
  @override
  _VaccinationStatusState createState() => _VaccinationStatusState();
}

class _VaccinationStatusState extends State<VaccinationStatus> {
  bool v = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccinated Status'),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: const Text('vaccinated'),
            value: timeDilation != 1.0,
            onChanged: (bool? value) {
              setState(() {
                timeDilation = value! ? 0.05 : 1.0;
                v = value;
              });
            },
          ),
          ElevatedButton(
              style: x,
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('USERS')
                    .doc('${FirebaseAuth.instance.currentUser!.uid}')
                    .update({
                  'Vaccination_status': v,
                });
              },
              child: Text('Change status'))
        ],
      ),
    );
  }
}
