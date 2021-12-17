import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'page2.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CmnDrawer(),
        appBar: AppBar(
          title: Text('Search patiant details'),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: idController,
                decoration: InputDecoration(
                  hintText: 'Enter patient id',
                  labelText: 'id',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () async {
                    DocumentSnapshot patiant = await FirebaseFirestore.instance
                        .collection('USERS')
                        .doc('${idController.text}')
                        .get();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Page2Screen(
                                  data: idController.text,
                                  data2: patiant,
                                )));
                  },
                  child: Text("search")),
            ),
          ],
        )));
  }
}
