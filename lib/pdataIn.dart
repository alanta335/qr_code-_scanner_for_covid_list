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
                    hintText: 'Enter  name',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: bpController,
                  decoration: InputDecoration(
                    hintText: 'Enter  name',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: bpController,
                  decoration: InputDecoration(
                    hintText: 'Enter  name',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: bpController,
                  decoration: InputDecoration(
                    hintText: 'Enter  name',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: bpController,
                  decoration: InputDecoration(
                    hintText: 'Enter  name',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: bpController,
                  decoration: InputDecoration(
                    hintText: 'Enter  name',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: bpController,
                  decoration: InputDecoration(
                    hintText: 'Enter  name',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: bpController,
                  decoration: InputDecoration(
                    hintText: 'Enter  name',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: bpController,
                  decoration: InputDecoration(
                    hintText: 'Enter  name',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: bpController,
                  decoration: InputDecoration(
                    hintText: 'Enter  name',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: bpController,
                  decoration: InputDecoration(
                    hintText: 'Enter  name',
                    labelText: 'Name',
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
