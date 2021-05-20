import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xAFE265D8),
      appBar: AppBar(
        title: Center(
          child: Text(
            "MY PORT-FOLIO",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        backgroundColor: Color(0xFF501474),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('images/p1.png'),
                  radius: 80,
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('images/p2.png'),
                  radius: 80,
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  height: 60,
                  child: Text(
                    'Alan T A',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Caveat',
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  height: 60,
                  child: Text(
                    'Akhil Krishna',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Caveat',
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'FLUTTER APP DEVELOPER',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Divider(
              indent: 130,
              endIndent: 130,
              thickness: 2,
              color: Colors.grey,
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              color: Colors.grey.shade400,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey.shade300),
                ),
                onPressed: () {},
                child: ListTile(
                  enableFeedback: true,
                  horizontalTitleGap: 40,
                  leading: Icon(
                    Icons.call_outlined,
                    size: 50,
                    color: Colors.grey.shade800,
                  ),
                  title: Text(
                    '+91 8289463489',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey.shade300),
                ),
                onPressed: () {},
                child: ListTile(
                  enableFeedback: true,
                  horizontalTitleGap: 40,
                  leading: Icon(
                    Icons.email_rounded,
                    size: 50,
                    color: Colors.grey.shade800,
                  ),
                  title: Text(
                    'alanta@gmail.com',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade800,
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
