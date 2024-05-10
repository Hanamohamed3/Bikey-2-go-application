import 'package:bikey_last/AllScreens/login_screen.dart';
import 'package:bikey_last/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class RegistrationScreen extends StatelessWidget {
  static const String idScreen = "register";

  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
              "Register",
              style: TextStyle(fontSize: 24.0, fontFamily: "Brand-Bold"),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 1.0),
                  TextField(
                    controller: nameTextEditingController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Name",
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
                    controller: phoneTextEditingController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Phone Number",
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
                      if (nameTextEditingController.text.length < 3) {
                        displayToastMessage(
                            "Name must be at least 3 characters", context);
                      } else if (!emailTextEditingController.text.contains(".")) {
                        displayToastMessage("Invalid Email", context);
                      } else if (phoneTextEditingController.text.isEmpty) {
                        displayToastMessage(
                            "Phone number is necessary", context);
                      } else if (passwordTextEditingController.text.length < 6) {
                        displayToastMessage(
                            "Password must be at least 6 characters", context);
                      } else {
                        registerNewUser(context);
                      }
                    },
                    child: Text("Create Account"),
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginScreen.idScreen, (route) => false);
                    },
                    child: Text(
                      "Already have an account? Login here",
                      style: TextStyle(color: Colors.green[600]),
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

  void registerNewUser(BuildContext context) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailTextEditingController.text,
              password: passwordTextEditingController.text);
      final User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final userDataMap = {
          "name": nameTextEditingController.text.trim(),
          "password": passwordTextEditingController.text.trim(),
          "phone": phoneTextEditingController.text.trim(),
          "email": emailTextEditingController.text,
        };
        userRef.child(firebaseUser.uid).set(userDataMap);
        displayToastMessage("Account has been created", context);
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.idScreen, (route) => false);
      } else {
        displayToastMessage("Account hasn't been created", context);
      }
    } catch (e) {
      displayToastMessage("Error: ${e.toString()}", context);
    }
  }

  void displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}




















