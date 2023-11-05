import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/assets/colors.dart';
import 'package:hackathon/login_Signup/login.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? name;
  String? role;
  String? location;
  String? number;
  bool isDataLoaded = false; // Flag to track if data is loaded

  @override
  void initState() {
    super.initState();
    getCurrentUserData();
  }

  Future<void> getCurrentUserData() async {
    User? user = _auth.currentUser;

    if (user != null) {
      DocumentSnapshot userSnapshot =
          await _firestore.collection('users').doc(user.uid).get();

      if (userSnapshot.exists) {
        setState(() {
          name = userSnapshot['name'];
          role = userSnapshot['role'];
          location = userSnapshot['location'];
          number = userSnapshot['number'];
          isDataLoaded = true; // Mark data as loaded
        });
      }
    }
  }

  // --------------------------logout----------------------
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("logged out");
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ));
      // The user is now signed out.
    } catch (e) {
      print("Error during signout: $e");
    }
  }
  // --------------------------logout----------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: MyColors.green,
      ),
      body: Stack(
        children: [
          Container(
            color: MyColors.green,
            height: 300,
            width: double.infinity,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  FaIcon(
                    FontAwesomeIcons.userDoctor,
                    size: 83,
                    color: MyColors.white100,
                  ),
                  Text(
                    "MedAppoint",
                    style: GoogleFonts.quando(
                        color: MyColors.white100,
                        fontSize: 23,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          // Upper container with image and title ed--------------------
          Center(
            child: Card(
              elevation: 30,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      if (!isDataLoaded) // Show a circular progress indicator while data is being loaded
                        CircularProgressIndicator(color: MyColors.green),
                      if (role != null)
                        Text(
                          "$role",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      const SizedBox(
                        height: 25,
                      ),
                      if (name != null)
                        Container(
                            padding: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 2))),
                            child: Text("Name: $name")),
                      const SizedBox(
                        height: 15,
                      ),
                      if (location != null)
                        Container(
                            padding: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 2))),
                            child: Text("Location: $location")),
                      const SizedBox(
                        height: 15,
                      ),
                      if (number != null)
                        Container(
                            padding: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 2))),
                            child: Text("Phone: $number")),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: 254,
                        height: 48,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(MyColors.green)),
                          onPressed: () {
                            logout();
                          },
                          child: const Text("Logout"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
