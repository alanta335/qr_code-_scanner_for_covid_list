import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr2/drawer.dart';

class PdataIn extends StatefulWidget {
  final pIDdata, pdata;
  const PdataIn({@required this.pIDdata, @required this.pdata});
  @override
  _PdataInState createState() => _PdataInState(pIDdata: pIDdata, pdata: pdata);
}

class _PdataInState extends State<PdataIn> {
  final pIDdata, pdata;
  _PdataInState({@required this.pIDdata, @required this.pdata});

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
      backgroundColor: Color(0x9FFA59F2),
      appBar: AppBar(
        title: Text(
          "patient data collection",
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
                    hintText: 'Enter  bp',
                    labelText: 'bp',
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
                    hintText: 'Enter  sugar',
                    labelText: 'sugar',
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
                    hintText: 'Enter  temp',
                    labelText: 'temp',
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
                    hintText: 'Enter  sleep',
                    labelText: 'sleep',
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
                    hintText: 'Enter  oxygen',
                    labelText: 'oxygen',
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
                    hintText: 'Enter  height',
                    labelText: 'height',
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
                    hintText: 'Enter  weight',
                    labelText: 'weight',
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
                    hintText: 'Enter  pain',
                    labelText: 'pain',
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
                    hintText: 'Enter other',
                    labelText: 'other',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    FirebaseFirestore.instance
                        .collection('USERS')
                        .doc('$pIDdata')
                        .collection('reading')
                        .doc(DateTime.now().toString())
                        .set({
                      'bp': bpController.text,
                      'timestamp': DateTime.now().toString(),
                      'checkedDoctorId': FirebaseAuth.instance.currentUser!.uid,
                      'pid': pIDdata,
                      'sug': sugarController,
                      'temp': tempController,
                      'oxy': oxyController,
                      'sleep': sleepController,
                      'height': heightController,
                      'weight': weightController,
                      'pain': painController,
                      'other': otherController,
                    });
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
