import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'drawer.dart';
import 'screenscaling.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final _url = 'tel:+91 1234567890';
  final _urlmail = 'mailto:coviqrr@gmail.com';
  void _launchURL() async => await launch(_url);
  void _launchmail() async => await launch(_urlmail);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CmnDrawer(),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "Customer Support",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              backgroundColor: Colors.deepPurple[400],
              backgroundImage: AssetImage('images/profile2.png'),
              radius: 100,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: SizeConfig.blockSizeVertical! * 14,
              //width: SizeConfig.blockSizeVertical! * 4,
              child: Card(
                shape: CircleBorder(),
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                color: Colors.grey.shade400,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepPurple.shade400),
                  ),
                  child: Row(children: <Widget>[
                    Icon(
                      Icons.notifications_none,
                      size: 40,
                      color: Colors.white,
                    ),
                    Text(
                      "For any issues, contact the developer",
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              color: Colors.grey.shade400,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.deepPurple.shade400),
                ),
                onPressed: _launchURL,
                child: ListTile(
                  enableFeedback: true,
                  horizontalTitleGap: 40,
                  leading: Icon(
                    Icons.call_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                  title: Text(
                    '+91 1234567890',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.deepPurple.shade400),
                ),
                onPressed: _launchmail,
                child: ListTile(
                  enableFeedback: true,
                  horizontalTitleGap: 40,
                  leading: Icon(
                    Icons.email_rounded,
                    size: 50,
                    color: Colors.white,
                  ),
                  title: Text(
                    'coviqrr@gmail.com',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
