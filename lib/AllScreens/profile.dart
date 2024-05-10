import 'package:bikey_last/AllScreens/edit_profile.dart';
import 'package:bikey_last/AllScreens/get_started.dart';
import 'package:bikey_last/AllScreens/google_screen.dart';
import 'package:bikey_last/AllScreens/history.dart';
import 'package:bikey_last/AllScreens/homepage.dart';
import 'package:bikey_last/AllScreens/information.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  static const String idScreen = "Profile";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, GoogleScreen.idScreen);
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
            icon: Icon(isDarkMode ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
          ),
        ],
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: isDarkMode ? Colors.black : Colors.white,
          child: Column(
            children: [
              
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(image: AssetImage('images/girl3.jpg')),
                ),
                
              ),
      
              SizedBox(height: 10),
              Text(
                'Hana Mohamed',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
Navigator.pushNamedAndRemoveUntil(
                    context, UpdateProfileScreen.idScreen, (route) => false);


                  },
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(color: isDarkMode ? Colors.black : Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode ? Colors.white : Colors.black,
                    side: BorderSide.none,
                    shape: StadiumBorder(),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Divider(
                color: isDarkMode ? Colors.grey[700] : Colors.grey[300],
              ),
              SizedBox(height: 10),

              ProfileMenuWidget(
                title: "Ride Details",
                icon: LineAwesomeIcons.wallet,
                onPress: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context, HistoryScreen.idScreen, (route) => false);
                },
                textColor: isDarkMode ? Colors.white : Colors.black,
              ),

              Divider(color: isDarkMode ? Colors.grey[700] : Colors.grey[300]),
              SizedBox(height: 10),
              ProfileMenuWidget(
                title: "Information",
                icon: LineAwesomeIcons.info,
                onPress: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context, InformationScreen.idScreen, (route) => false);
                },
                textColor: isDarkMode ? Colors.white : Colors.black,
              ),
              ProfileMenuWidget(
                title: "Logout",
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: isDarkMode ? Colors.white : Colors.black,
                endIcon: false,
                onPress: () {
                  // Logging out logic...
                  Navigator.pushNamedAndRemoveUntil(
                    context, GetStarted.idScreen, (route) => false);
                },
              ),

              
              ElevatedButton(
                onPressed: () {
                  // Show confirmation dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Confirm Deletion"),
                        content: Text("Are you sure you want to delete your account?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Dismiss the dialog
                              Navigator.of(context).pop();
                            },
                            child: Text("No"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                GetStarted.idScreen,
                                (route) => false,
                              );
                            },
                            child: Text("Yes"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Delete Account"),
              ),
              SizedBox(height: 120,)
            ],
          ),
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
        },
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blue[100],
        ),
        child: Icon(icon, color: Colors.blue[800]),
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      trailing: endIcon
          ? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey[100],
        ),
        child: Icon(LineAwesomeIcons.angle_right, size: 18.0, color: Colors.grey[700]),
      )
          : null,
    );
  }
}





