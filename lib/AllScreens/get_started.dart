import 'package:flutter/material.dart';
import 'package:bikey_last/AllScreens/registeration_screen.dart';

class GetStarted extends StatelessWidget {
  static const String idScreen = "First";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bikey 2 Go',
              style: TextStyle( fontWeight: FontWeight.bold,
             fontSize: 40.0, fontFamily: "Signatra"),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Text(
              'Ride with confidence ',
              style: TextStyle(fontSize: 30.0  , color: Colors.grey[700]),
            ),
            SizedBox(height: 20.0),
            Image.asset(
              'images/bikephone.jpg', 
              width: 500.0,
              height: 500.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, RegistrationScreen.idScreen, (route) => false);
                
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

