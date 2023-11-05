import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/assets/colors.dart';
import 'package:hackathon/login_Signup/loginDoctor.dart';
import 'package:hackathon/login_Signup/signup.dart';

import 'package:hackathon/screens/homeScreenDevathon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      emailController.clear();
      passwordController.clear();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return homeScreenView();
      }));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
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
                  height: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Text(
                          "Pateint Login",
                          style: GoogleFonts.quando(
                              color: MyColors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: MyColors.greenLight,
                            border: Border.all(
                              color: MyColors.greenDark, // Border color
                              width: 1.0, // Border width
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              fillColor: MyColors.greenLight,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              hintText: "Email",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: MyColors.greenLight,
                            border: Border.all(
                              color: MyColors.greenDark, // Border color
                              width: 1.0, // Border width
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(
                                20.0)), // Adjust the radius for square corners
                          ),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              fillColor: MyColors.greenLight,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      10.0), // Optional: Adjust the text padding
                              hintText: "Password",
                              border: InputBorder
                                  .none, // Remove the default input border
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 254,
                          height: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                20.0), // Adjust the radius as needed
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(MyColors.green),
                              ),
                              onPressed: () {
                                signIn();
                              },
                              child: Text("SignIn"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignUpScreen();
                              }));
                            },
                            child: const Text("Go to Sign Up screen")),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginDoctorScreen();
                              }));
                            },
                            child: const Text("Go to Doctor Login"))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
