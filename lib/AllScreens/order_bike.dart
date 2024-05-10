import 'package:bikey_last/AllScreens/homepage.dart';
import 'package:bikey_last/AllScreens/profile.dart';
import 'package:flutter/material.dart';
import 'package:bikey_last/AllScreens/captian_details.dart';
import 'package:bikey_last/AllScreens/google_screen.dart';

class OrderBike extends StatelessWidget {
  static const String idScreen = "Bike";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 45.0),
            Container(
              width: 800.0,
              height: 560.0,
              alignment: Alignment.center,
              child: Image.asset(
                'images/ss.png',
                width: 700.0,
                height: 535.0,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Nearest Bike is in SmouhaClub",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                     Navigator.pushNamedAndRemoveUntil(
                          context, CaptianDetails.idScreen, (route) => false);
                  },
                  child: Text('Continue'),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                     Navigator.pushNamedAndRemoveUntil(
                          context, GoogleScreen.idScreen, (route) => false);
                    
                  },
                  child: Text('Go Back'),
                ),
              ],
            ),
          ],
        ),
      ),
            bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, GoogleScreen.idScreen);
          }
          if (index == 1) {
            Navigator.pushNamed(context, HomePage.idScreen);
          }
          if (index == 2) {
            Navigator.pushNamed(context, ProfileScreen.idScreen);
          }
        },
      ),
    );
  }
}

           





 








  

  
