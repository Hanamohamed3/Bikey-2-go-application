import 'package:bikey_last/AllScreens/google_screen.dart';
import 'package:bikey_last/AllScreens/profile.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {
   UpdateProfileScreen({Key? key}) : super(key: key);
  static const String idScreen = "EditProfile";

  final TextEditingController name2TextEditingController =
      TextEditingController();
  final TextEditingController email2TextEditingController =
      TextEditingController();
  final TextEditingController phone2TextEditingController =
      TextEditingController();
  final TextEditingController password2TextEditingController =
      TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context, ProfileScreen.idScreen, (route) => false);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('images/girl3.jpg'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue[400],
                      ),
                      child: Icon(
                        LineAwesomeIcons.camera,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildInputField(label: 'Name',),
              SizedBox(height: 10),
              _buildInputField(label: 'Password'),
              SizedBox(height: 10),
              _buildInputField(label: 'Email'),
              SizedBox(height: 10),
              _buildInputField(label: 'Phone Number'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Show confirmation dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        // title: Text("Your Data has changed "),
                        content: Text("Are you sure you want to change your data?"),
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
                                GoogleScreen.idScreen,
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
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({required String label}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}














