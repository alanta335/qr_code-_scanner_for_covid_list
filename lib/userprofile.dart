import 'package:flutter/material.dart';

import 'drawer.dart';
import 'screenscaling.dart';

class UserProfile extends StatelessWidget {
  final name;
  final email;
  final pno;
  final addres;
  final vstatus;

  UserProfile({
    @required this.name,
    @required this.email,
    @required this.pno,
    @required this.addres,
    @required this.vstatus,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CmnDrawer(),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "My Details",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffffffff),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black38,
              backgroundImage: AssetImage(
                'images/profile1.png',
              ),
              radius: 120,
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 60,
              child: Text(
                'Profile Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Caveat',
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              indent: 130,
              endIndent: 130,
              thickness: 2,
              color: Colors.deepPurple.shade400,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Name: $name',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.deepPurple.shade400,
                    ),
                  ),
                  Text(
                    'Address: $addres',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.deepPurple.shade400,
                    ),
                  ),
                  Text(
                    'Phone NO: $pno',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.deepPurple.shade400,
                    ),
                  ),
                  Text(
                    'Email: $email',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.deepPurple.shade400,
                    ),
                  ),
                  Text(
                    'Vaccination status: $vstatus',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.deepPurple.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
