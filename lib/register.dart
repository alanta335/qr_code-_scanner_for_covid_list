import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'qrGenerator.dart';
import 'qrScanner.dart';

class RegisterPage extends StatefulWidget {
  final bool us;
  RegisterPage(this.us);
  @override
  _RegisterPageState createState() => _RegisterPageState(us: us);
}

class _RegisterPageState extends State<RegisterPage> {
  final bool us;
  _RegisterPageState({required this.us});
  var a = 'ENTER THE DETAILS';
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController pnoController = TextEditingController();
  TextEditingController addresController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Register page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'enter your name here',
                      labelText: 'name',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: pnoController,
                    decoration: InputDecoration(
                      hintText: 'enter your phone no here',
                      labelText: 'phone number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
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
                    controller: addresController,
                    decoration: InputDecoration(
                      hintText: 'enter your addres here',
                      labelText: 'addres',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.streetAddress,
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: repasswordController,
                    decoration: InputDecoration(
                      hintText: 'enter your password here',
                      labelText: 're-enter password',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(a,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.indigoAccent.shade400,
                      )),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (passwordController.text != repasswordController.text) {
                      setState(() {
                        a = 'RE-nter the password';
                        passwordController.text = '';
                        repasswordController.text = '';
                      });
                    } else {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                        if (us == true) {
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

                        FirebaseFirestore.instance
                            .collection('USERS')
                            .doc('${FirebaseAuth.instance.currentUser!.uid}')
                            .set({
                          'name': nameController.text,
                          'email': emailController.text,
                          'pno': pnoController.text,
                          'addres': addresController.text,
                          'timestamp': DateTime.now().toString(),
                          'userId': FirebaseAuth.instance.currentUser!.uid,
                          'user_type': us,
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          setState(() {
                            a = 'The password provided is too weak.';
                          });
                        } else if (e.code == 'email-already-in-use') {
                          setState(() {
                            a = 'The account already exists for that email.';
                          });
                        }
                      } catch (e) {
                        setState(() {
                          a = e.toString();
                        });
                      }
                    }
                  },
                  child: Text('Register'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
