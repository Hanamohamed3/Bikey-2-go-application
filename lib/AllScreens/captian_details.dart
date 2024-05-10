// import 'package:bikey_last/AllScreens/api.dart';
import 'package:bikey_last/AllScreens/google_screen.dart';
import 'package:bikey_last/AllScreens/homepage.dart';
import 'package:bikey_last/AllScreens/profile.dart';
import 'package:flutter/material.dart';
import 'package:bikey_last/AllScreens/ride_details.dart';

// ignore: must_be_immutable
class CaptianDetails extends StatelessWidget {
  static const String idScreen = "captian";
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
              child: Image.asset('images/ss.png',
               width: 700.0,
              height: 535.0,
              fit: BoxFit.fitHeight,
               ),
            ),
         Text(
              "!!Captian has arrived !!",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold ,color: Colors.red[700]),
            ),
             const SizedBox(height: 10.0),
            Text(
              "Captian & Bike details",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
           
            Row(
                children: [
                                      Image.asset('images/mot.png',height: 30.0 , width: 50.0,)
                                      ,
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Captian's Name: Mohamed Farouk"),
                   Text("Bike Details:Black SYM ORBIT, Number Plates: 1234 س ع ه "),],)

                ],
              ),
            SizedBox(height: 10.0), 
            ElevatedButton(
              onPressed: () {
                     Navigator.pushNamedAndRemoveUntil(
                          context, RideDetails.idScreen, (route) => false);
                    
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400], 
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                "End Ride",
                style: TextStyle(fontSize: 16),
              ),
            ),
            ])
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