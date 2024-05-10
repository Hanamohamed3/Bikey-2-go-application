import 'package:bikey_last/AllScreens/homepage.dart';
import 'package:bikey_last/AllScreens/profile.dart';
import 'package:flutter/material.dart';
import 'package:bikey_last/AllScreens/order_bike.dart';

class GoogleScreen extends StatelessWidget {
  static const String idScreen = "Map";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              "Pickup location",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Image.asset(
                  'images/desticon.png',
                  height: 30.0,
                  width: 50.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Fathallah Gomla Market"),
                    Text("Fathallah Gomla Market-Ezbet saad-Alexandria"),
                  ],
                )
              ],
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, OrderBike.idScreen, (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[300],
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                "Confirm pickup",
                style: TextStyle(fontSize: 16),
              ),
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




