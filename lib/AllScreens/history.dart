
// import 'package:bikey_last/AllScreens/api.dart';
import 'package:bikey_last/AllScreens/google_screen.dart';
import 'package:bikey_last/AllScreens/homepage.dart';
import 'package:bikey_last/AllScreens/profile.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HistoryScreen extends StatelessWidget {
  static const String idScreen = "History";


  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, ProfileScreen.idScreen);
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text('Your Rides History'),
      ),
      body: Wrap(
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 40),
        Icon(LineAwesomeIcons.map_pin,color: Colors.red,),
        SizedBox(width: 5), // Adjust the spacing between the icon and the text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '28 Nov 2023, 10:51 PM',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Leo Supermarket, Elibrahmeya Street',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    ),
    Divider(),
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 40),
        Icon(LineAwesomeIcons.map_pin
        ,color: Colors.red,),
        SizedBox(width: 5), // Adjust the spacing between the icon and the text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '29 Nov 2023, 11:00 PM',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Smouha sporting club',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    ),
    Divider(), // Add a divider after each item


    
  ],
),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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
    

