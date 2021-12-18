import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'mreader.dart';

class PdataIn extends StatefulWidget {
  final pIDdata, pdata, type;
  const PdataIn(
      {@required this.pIDdata, @required this.pdata, @required this.type});
  @override
  _PdataInState createState() =>
      _PdataInState(pIDdata: pIDdata, pdata: pdata, type: type);
}

class _PdataInState extends State<PdataIn> {
  final pIDdata, pdata, type;
  _PdataInState(
      {@required this.pIDdata, @required this.pdata, @required this.type});

  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController bpController = TextEditingController();
  TextEditingController sugarController = TextEditingController();
  TextEditingController tempController = TextEditingController();
  TextEditingController oxyController = TextEditingController();
  TextEditingController sleepController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController painController = TextEditingController();
  TextEditingController otherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new CmnDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Patient Data Collection",
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        backgroundColor: Colors.deepPurple.shade400,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: bpController,
                  decoration: InputDecoration(
                    hintText: 'Enter the blood pressure',
                    labelText: 'Blood pressure',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: sugarController,
                  decoration: InputDecoration(
                    hintText: 'Enter blood sugar level',
                    labelText: 'Sugar level in mg',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: tempController,
                  decoration: InputDecoration(
                    hintText: 'Enter the body temperature',
                    labelText: 'Temperature',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: sleepController,
                  decoration: InputDecoration(
                    hintText: 'Enter sleep duration',
                    labelText: 'Sleep duration in hours',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: oxyController,
                  decoration: InputDecoration(
                    hintText: 'Enter Oxygen level',
                    labelText: 'Oxygen level',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: heightController,
                  decoration: InputDecoration(
                    hintText: 'Enter the height',
                    labelText: 'Height',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    hintText: 'Enter the body Weight: ',
                    labelText: 'Weight',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: painController,
                  decoration: InputDecoration(
                    hintText: 'Enter about Pain details:',
                    labelText: 'Enter here',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: otherController,
                  decoration: InputDecoration(
                    hintText: 'Enter other symptoms:',
                    labelText: 'Symptoms',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    DocumentSnapshot user = await FirebaseFirestore.instance
                        .collection('USERS')
                        .doc('${FirebaseAuth.instance.currentUser!.uid}')
                        .get();
                    DocumentSnapshot store = await FirebaseFirestore.instance
                        .collection('USERS')
                        .doc('$pIDdata')
                        .get();
                    FirebaseFirestore.instance
                        .collection('USERS')
                        .doc('${FirebaseAuth.instance.currentUser!.uid}')
                        .collection('patiant visited')
                        .doc(DateTime.now().toString())
                        .set({
                      'name': store['name'],
                      'type': 'patiant',
                      'address': store['addres'],
                      'phno': store['pno'],
                      'visitedId': store['userId'],
                      'time': DateTime.now().toString().substring(0, 16),
                      'vaccination_status': store['vaccination_status'],
                    });
                    print(store['name']);
                    print(user['name']);
                    FirebaseFirestore.instance
                        .collection('USERS')
                        .doc('$pIDdata')
                        .collection('doctor visited')
                        .doc(DateTime.now().toString().substring(0, 16))
                        .set({
                      'name': 'DR.${user['name']}',
                      'type': 'doctor',
                      'address': user['addres'],
                      'phno': user['pno'],
                      'visitedId': user['userId'],
                      'time': DateTime.now().toString(),
                      'vaccination_status': user['vaccination_status'],
                    });
                    FirebaseFirestore.instance
                        .collection('USERS')
                        .doc('$pIDdata')
                        .collection('reading')
                        .doc(DateTime.now().toString().substring(0, 16))
                        .set({
                      'bp': bpController.text,
                      'timestamp': DateTime.now().toString().substring(0, 16),
                      'checkedDoctorId': FirebaseAuth.instance.currentUser!.uid,
                      'pid': pIDdata,
                      'sug': sugarController.text,
                      'temp': tempController.text,
                      'oxy': oxyController.text,
                      'sleep': sleepController.text,
                      'height': heightController.text,
                      'weight': weightController.text,
                      'pain': painController.text,
                      'other': otherController.text,
                    });
                    DocumentSnapshot users = await FirebaseFirestore.instance
                        .collection('USERS')
                        .doc('${FirebaseAuth.instance.currentUser!.uid}')
                        .get();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UserInformation(type: users['user_type'])));
                  },
                  child: Text("save patient data"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
