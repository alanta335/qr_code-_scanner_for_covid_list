import 'package:flutter/material.dart';
import 'drawer.dart';
import 'screenscaling.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new CmnDrawer(),
      backgroundColor: Color(0x9FFA59F2),
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        backgroundColor: Colors.deepPurple.shade400,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                      fontSize: 27,
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
                    'Akhil Krishna S',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Caveat',
                      color: Colors.black,
                      fontSize: 27,
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
              'FLUTTER APP DEVELOPERS',
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
            Text(
              "We are students of NSS College of engineering. This Project was made as a part of Build From Home event hosted by Tinkerhub",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white54,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
