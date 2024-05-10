// import 'package:bikey_last/AllScreens/api.dart';
import 'package:bikey_last/AllScreens/google_screen.dart';
import 'package:bikey_last/AllScreens/homepage.dart';
import 'package:bikey_last/AllScreens/profile.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class InformationScreen extends StatelessWidget {
  static const String idScreen = "Information";

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
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bikey 2 Go is building ‘the everything app’ for the greater Middle East, making it easier than ever to move around, manage payments, and more. Bikey 2 Go is led by a powerful purpose to simplify and improve the lives of people and build an awesome organisation that inspires.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Since 2012, Bikey 2 Go has created earnings for over 2.5 million Captains, simplified the lives of over 50 million customers, and built a platform for the region’s best talent to thrive and for entrepreneurs to scale their businesses. Careem operates in over 70 cities across 10 countries, from Morocco to Pakistan.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Solidifying our position as the biggest unicorn in the Middle East and providing new opportunities for startups in the region. This acquisition allowed us to bring some of the best talent into our organisation, which was a critical part of our growth strategy.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Now, we’re excited to explore synergies with the global technology investor e& following their 400 million investment in the Bikey 2 Go Super App. We’re looking forward to building category-leading verticals and scaling the Super App across our key markets.',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
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

