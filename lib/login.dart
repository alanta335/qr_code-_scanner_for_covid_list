import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'qrGenerator.dart';
import 'qrScanner.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' LOGIN PAGE'),
      ),
      body: Center(
        child: Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'enter your email here',
                    labelText: 'email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'enter your password here',
                    labelText: 'password',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // ignore: unused_local_variable
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                    DocumentSnapshot user = await FirebaseFirestore.instance
                        .collection('USERS')
                        .doc('${FirebaseAuth.instance.currentUser!.uid}')
                        .get();
                    if (user['user_type'] == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QRViewExample()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneratePage()));
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                },
                child: Text('LOGIN'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
