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
    print('${data['bp'].toString()}+++++++++++++++++++++++++++++');
    return Scaffold(
      drawer: CmnDrawer(),
      appBar: AppBar(
        title: Text('patiant Details'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Store Name: ${data['bp']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'Store Name: ${data['oxy']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'Store Name: ${data['height']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'Store Name: ${data['other']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'Store Name: ${data['pain']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'Store Name: ${data['pid']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'Store Name: ${data['sleep']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'Store Name: ${data['sug']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'Store Name: ${data['temp']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'Store Name: ${data['timestamp']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'Store Name: ${data['checkedDoctorId']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
