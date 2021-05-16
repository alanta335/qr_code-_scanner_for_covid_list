import 'package:flutter/material.dart';

class Page2Screen extends StatelessWidget {
  final data;
  Page2Screen({@required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page 2'),
      ),
      body: Center(
        child: Text('data is $data'),
      ),
    );
  }
}
