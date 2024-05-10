import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bikey_last/AllScreens/google_screen.dart';
import 'package:bikey_last/AllScreens/registeration_screen.dart';


class LoginScreen extends StatelessWidget {
  static const String idScreen = "login"; 
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 45.0),
            Text(
              "Bikey 2 Go",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  fontFamily: "Signatra"),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 390.0,
              height: 260.0,
              alignment: Alignment.center,
              child: Image.asset("images/bike.png"),
            ),
            SizedBox(height: 1.0),
            Text(
              "Login",
              style: TextStyle(fontSize: 24.0, fontFamily: "Brand-Bold"),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 1.0),
                  TextField(
                    controller: emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.0,
                      ),
                    ),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 1.0),
                  TextField(
                    controller: passwordTextEditingController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.0,
                      ),
                    ),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      if (!emailTextEditingController.text.contains("@")) {
                        displayToastMessage("Invalid Email", context);
                      } else if (passwordTextEditingController
                          .text.isEmpty) {
                        displayToastMessage(
                            "Password is mandatory", context);
                      } else {
                        loginAndAuthenticateUser(context);
                      }
                    },
                    child: Text(
                      "Login Now",
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          RegistrationScreen.idScreen,
                          (route) => false);
                    },
                    child: Text(
                      "Don't have an account? Register here ",
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthenticateUser(BuildContext context) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
              email: emailTextEditingController.text,
              password: passwordTextEditingController.text);
      final User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final DatabaseEvent snap =await FirebaseDatabase.instance.ref().child("users").child(firebaseUser.uid).once() ;
        if (snap.snapshot.value != null ) {
          Navigator.pushNamedAndRemoveUntil(
              context, GoogleScreen.idScreen, (route) => false);
          displayToastMessage("You are logged in now", context);
        } else {
          _firebaseAuth.signOut();
          displayToastMessage("You are logged in now", context);
        Navigator.pushNamedAndRemoveUntil(
                          context,
                          GoogleScreen.idScreen,
                          (route) => false);
        }
      } else {
        displayToastMessage("Error occurred, can't be signed in", context);
      }
    } catch (error) {
      displayToastMessage("Error: $error", context);
    }
  }

  void displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}









