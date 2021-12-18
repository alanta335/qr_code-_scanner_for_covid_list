import 'package:flutter/material.dart';
import 'package:vscan/screenscaling.dart';

import 'drawer.dart';

class SosPage extends StatefulWidget {
  const SosPage({Key? key}) : super(key: key);

  @override
  _SosPageState createState() => _SosPageState();
}

class _SosPageState extends State<SosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CmnDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade400,
          title: Text('SOS'),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 300),
                Center(
                    child: ElevatedButton(
                        style: x, onPressed: () {}, child: Text('SOS'))),
              ],
            )
          ],
        )));
  }
}
