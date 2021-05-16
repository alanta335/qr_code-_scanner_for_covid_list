import 'package:flutter/material.dart';
import 'qrScanner.dart';
import 'qrGenerator.dart';

void main() => runApp(MaterialApp(home: ChoosingPage()));

class ChoosingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('choosing page'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QRViewExample()));
                },
                child: Text('customer'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GeneratePage()));
                },
                child: Text('store operator'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
