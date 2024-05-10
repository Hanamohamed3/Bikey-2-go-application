// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';


// class MainScreen extends StatefulWidget{
//   static const String idScreen ="mainScreen";
//   @override
//   _MainScreenState createState() => _MainScreenState();

// }

// class _MainScreenState extends State<MainScreen> {

// final Completer<GoogleMapController> _controllerGoogleMap =
//       Completer<GoogleMapController>();
//       late GoogleMapController newGoogleMapController;
// static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//    @override
//  Widget build(BuildContext context){
//     return Scaffold(
//     appBar: AppBar(
//       title: Text("Main Screen"),
// ), 
// body: Stack(
//   children: [
//     GoogleMap(
//       mapType: MapType.normal,
//       myLocationButtonEnabled: true,
//       initialCameraPosition: _kGooglePlex,
//       onMapCreated:(GoogleMapController controller){
//          _controllerGoogleMap.complete(controller);
//          newGoogleMapController = controller;
//       }
//     ),
//   ],
// ),// AppBar

// );
//  } } // Scaffold

// import 'package:flutter/material.dart';



// class MainScreen extends StatefulWidget {
//   static const String idScreen ="mainScreen";

//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() =>
//       _MainScreenState();
// }

// class _MainScreenState
//     extends State<MainScreen> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Business',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: School',
//       style: optionStyle,
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('BottomNavigationBar Sample'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
