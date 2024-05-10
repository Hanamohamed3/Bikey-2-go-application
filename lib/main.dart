import 'package:bikey_last/AllScreens/edit_profile.dart';
import 'package:bikey_last/AllScreens/history.dart';
import 'package:bikey_last/AllScreens/homepage.dart';
import 'package:bikey_last/AllScreens/information.dart';
import 'package:bikey_last/AllScreens/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:bikey_last/AllScreens/captian_details.dart';
import 'package:bikey_last/AllScreens/get_started.dart';
import 'package:bikey_last/AllScreens/google_screen.dart';
import 'package:bikey_last/AllScreens/login_screen.dart';
import 'package:bikey_last/AllScreens/order_bike.dart';
import 'package:bikey_last/AllScreens/registeration_screen.dart';
import 'package:bikey_last/AllScreens/ride_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      projectId: "bikelast-21417",
      apiKey: 'AIzaSyAYsDtN1a1GNjgi6zDvebYaCDXD-j5dEEA',
      appId: '1:57669454174:android:fe76a36952a2a47572a7cf',
      messagingSenderId: '57669454174',
      databaseURL: "https://bikelast-21417-default-rtdb.firebaseio.com",
    ),
  );
  runApp(MyApp());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.ref().child("bikelast-21417");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bikey 2 Go',
      theme: ThemeData(
        fontFamily: "Brand-Bold",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: GetStarted.idScreen,
      routes: {
        RegistrationScreen.idScreen: (context) => RegistrationScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        // MainScreen.idScreen: (context) => MainScreen(),
        GoogleScreen.idScreen: (context) => GoogleScreen(),
        OrderBike.idScreen: (context) => OrderBike(),
        CaptianDetails.idScreen: (context) => CaptianDetails(),
        RideDetails.idScreen: (context) => RideDetails(),
        GetStarted.idScreen: (context) => GetStarted(),
        ProfileScreen.idScreen: (context) => ProfileScreen(),
        InformationScreen.idScreen: (context) => InformationScreen(),
        HistoryScreen.idScreen: (context) => HistoryScreen(),
        UpdateProfileScreen.idScreen: (context) => UpdateProfileScreen(),
        HomePage.idScreen: (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
