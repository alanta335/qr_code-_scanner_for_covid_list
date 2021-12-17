import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'drawer.dart';

class PRecord extends StatefulWidget {
  final data;
  const PRecord({@required this.data});
  @override
  _PRecordState createState() => _PRecordState(data: data);
}

class _PRecordState extends State<PRecord> {
  var data;
  var result = "";
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
                  'bp: ${data['bp']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'oxy: ${data['oxy']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'height: ${data['height']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'other: ${data['other']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'pain: ${data['pain']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'patiant id: ${data['pid']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'sleep time: ${data['sleep']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'sugar level: ${data['sug']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'temp: ${data['temp']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'time checked: ${data['timestamp']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  'doctor id: ${data['checkedDoctorId']}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: Text(
                  "$result",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      var postData = await createAlbum(data['bp'].toString());
                      var respconvert = albumFromJson(postData.body.toString());
                      setState(() {
                        result = respconvert.title;
                      });
                    },
                    child: Text("Evaluvate")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
  Album({
    required this.title,
  });

  String title;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}

Future<http.Response> createAlbum(String title) {
  return http.post(
    Uri.parse('http://sfbsgda.pythonanywhere.com/cal'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );
}
