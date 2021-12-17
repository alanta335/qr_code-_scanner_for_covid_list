import 'package:flutter/material.dart';

import 'drawer.dart';

class PRecord extends StatefulWidget {
  final data;
  const PRecord({@required this.data});
  @override
  _PRecordState createState() => _PRecordState(data: data);
}

class _PRecordState extends State<PRecord> {
  var data;
  _PRecordState({@required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CmnDrawer(),
      appBar: AppBar(
        title: Text('patiant Details'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
