// import 'package:bikey_last/AllScreens/api.dart';
import 'package:bikey_last/AllScreens/homepage.dart';
import 'package:bikey_last/AllScreens/profile.dart';
import 'package:flutter/material.dart';
import 'package:bikey_last/AllScreens/google_screen.dart';


class RideDetails extends StatelessWidget {
  static const String idScreen = "Ride";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

 
          Positioned.fill(
            child: Container(
              color: Colors.white,
            ),
          ),
          Positioned(
            left: 50.0,
            top: 200.0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.green[700],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Ride has ended ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Your ride was for 21 mins for 21 LE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Please Rate Your Ride:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 400.0, // Adjust the position of buttons as needed
            left: 35.0,
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                          context, GoogleScreen.idScreen, (route) => false);
                  },
                  icon: Row(
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                    ],
                  ),
                  label: Text(""),
                ),
                SizedBox(width: 10.0),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                          context, GoogleScreen.idScreen, (route) => false);
                  },
                  icon: Row(
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                    ],
                  ),
                  label: Text(""),
                ),
                SizedBox(width:10.0),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                          context, GoogleScreen.idScreen, (route) => false);
                    
                  },
                  icon: Icon(Icons.star),
                  label: Row(
                    
                  ),
                ),
              ],
            ),
          ),
        ],
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

