import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/assets/colors.dart';
import 'package:hackathon/assets/global.dart';
import 'package:hackathon/login_Signup/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // contollers start ----------------------------------------
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  // TextEditingController bloodGroupController = TextEditingController();
  // contollers End ----------------------------------------

  createUserFunc() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      String? uid = userCredential.user?.uid; // Use null safe operators
      if (uid != null) {
        addUsertoDB(uid);

        emailController.clear();
        nameController.clear();
        passwordController.clear();
        locationController.clear();
        numberController.clear();
        // bloodGroupController.clear();

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
      } else {
        // Handle the case where uid is null
        print('User UID is null');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // -------------adding user in db ------------------------
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference doctors =
      FirebaseFirestore.instance.collection('doctors');

  Future<void> addUsertoDB(String uid) {
    if (selectedRole == "Doctor") {
      // If selectedRole is "Doctor," store the data in the "doctors" collection.
      return doctors
          .doc(uid)
          .set({
            'name': nameController.text,
            'email': emailController.text,
            "role": selectedRole,
            "category": selectedCategory,
            "location": locationController.text,
            "number": numberController.text,
            "id": uid,
          })
          .then((value) => print("Doctor Signed Up and Added"))
          .catchError((error) => print("Failed to add doctor: $error"));
    } else {
      // If selectedRole is not "Doctor," store the data in the "users" collection.
      return users
          .doc(uid)
          .set({
            'name': nameController.text,
            'email': emailController.text,
            "role": selectedRole,
            "category": selectedCategory,
            "location": locationController.text,
            "number": numberController.text,
            "id": uid,
          })
          .then((value) => print("User Signed Up and Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
  }

  // ----------------disposing cintrokllers --------------
  @override
  void dispose() {
    // Dispose of the TextEditingController when it's no longer needed.
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
              child: SingleChildScrollView(
                child: Container(
                  width: 300,
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "Sign Up",
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
                              controller: nameController,
                              decoration: InputDecoration(
                                fillColor: MyColors.greenLight,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: "Name",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                fillColor: MyColors.greenLight,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: "Password",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: TextFormField(
                              controller: locationController,
                              decoration: InputDecoration(
                                fillColor: MyColors.greenLight,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: "Location",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: TextFormField(
                              controller: numberController,
                              decoration: InputDecoration(
                                fillColor: MyColors.greenLight,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.0),
                                hintText: "Phone Number",
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     color: MyColors.greenLight,
                          //     border: Border.all(
                          //       color: MyColors.greenDark, // Border color
                          //       width: 1.0, // Border width
                          //     ),
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(20.0)),
                          //   ),
                          //   child: TextFormField(
                          //     controller: bloodGroupController,
                          //     decoration: InputDecoration(
                          //       fillColor: MyColors.greenLight,
                          //       contentPadding:
                          //           EdgeInsets.symmetric(horizontal: 10.0),
                          //       hintText: "Blood Group",
                          //       border: InputBorder.none,
                          //     ),
                          //   ),
                          // ),

                          const SizedBox(
                            height: 10,
                          ),

                          //  Dropdown for selecting role------------------------
                          DropdownButton<String>(
                            value: selectedRole,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedRole = newValue;
                              });
                            },
                            items: roleOptions.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          //  -----------Dropdown for selecting role------------------------
                          // ------------- Dropdown for selecting Category------------------------
                          selectedRole == "Doctor"
                              ? DropdownButton<String>(
                                  value: selectedCategory,
                                  onChanged: (String? newwValue) {
                                    setState(() {
                                      selectedCategory = newwValue;
                                    });
                                  },
                                  items: categoryOptions.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )
                              : SizedBox(),
                          //  -----------Dropdown for selecting Category------------------------
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 254,
                            height: 48,
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(MyColors.green),
                                ),
                                onPressed: () {
                                  createUserFunc();
                                },
                                child: Text("SignUp")),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginScreen();
                                }));
                              },
                              child: const Text("Go to Sign In screen"))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
