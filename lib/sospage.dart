import 'package:flutter/material.dart';

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
          title: Text('Search patiant details'),
        ),
        body: SafeArea(
            child: Column(
          children: [],
        )));
  }
}
