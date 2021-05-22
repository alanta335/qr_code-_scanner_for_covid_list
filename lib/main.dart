import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'screenscaling.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.deepPurple.shade400),
      home: ChoosingPage()));
}

class ChoosingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var x = ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(Colors.deepPurple.shade400),
    );
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'CoViQRr',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/applogo.png'),
              width: SizeConfig.safeBlockHorizontal! * 50,
              height: SizeConfig.safeBlockVertical! * 30,
            ),
            SizedBox(
              width: SizeConfig.screenWidth! * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: x,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('Log in'),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.screenWidth! * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: x,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage(true)));
                  },
                  child: Text('Register as Customer'),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.screenWidth! * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: x,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage(false)));
                  },
                  child: Text('Register as Store Owner'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
