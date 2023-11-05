import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/assets/colors.dart';
import 'package:hackathon/screens/allDoctorsScreen.dart';
import 'package:hackathon/screens/appointmnetScreen.dart';
import 'package:hackathon/screens/logoutPage.dart';

class homeScreenView extends StatefulWidget {
  const homeScreenView({super.key});

  @override
  State<homeScreenView> createState() => _homeScreenViewState();
}

class _homeScreenViewState extends State<homeScreenView> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('doctors').snapshots();
  // --------------------------------------- slected category Start ------------------
  String selectedCategory = '';

  List<String> categories = ['All', 'Cardiology', 'General', 'Medicine'];

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  int selectedCardIndex = -1; // Initially, no card is selected.
  // --------------------------------------- slected category end ------------------
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // appBar: AppBar(),
            body: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [MyColors.greenLight, MyColors.green, MyColors.green],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.line_weight_sharp,
                      color: MyColors.white100,
                      size: 29,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return LogoutPage();
                          },
                        ));
                      },
                      icon: Icon(
                        Icons.supervised_user_circle_outlined,
                        color: MyColors.white100,
                        size: 29,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back!",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: MyColors.white100),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Let's Find",
                      style: GoogleFonts.poppins(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: MyColors.white100),
                    ),
                    Text(
                      "Your Doctor",
                      style: GoogleFonts.poppins(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: MyColors.white100),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Doctor's Inn",
                      style: GoogleFonts.poppins(
                          fontSize: 42,
                          fontWeight: FontWeight.w500,
                          color: MyColors.white100),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 150,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Categories",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: categories.map((category) {
              //     bool isActive = category == selectedCategory;
              //     return GestureDetector(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) =>
              //                 AllDoctorsView(category: category),
              //             // AllDoctorsView(category: selectedCategory),
              //           ),
              //         );
              //       },
              //       child: Container(
              //         padding: EdgeInsets.all(10),
              //         decoration: BoxDecoration(
              //           color: MyColors.greenLight,
              //           border: Border.all(
              //             color: MyColors.greenDark,
              //             width: 2,
              //           ),
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Center(
              //           child: Text(
              //             category,
              //             style: TextStyle(
              //               color: isActive ? MyColors.greenDark : Colors.black,
              //             ),
              //           ),
              //         ),
              //       ),
              //     );
              //   }).toList(),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AllDoctorsView(category: "All");
                        },
                      ));
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: 75,
                        child: Column(
                          children: [
                            Image.asset(
                              "images/all.png",
                              width: 26,
                              height: 40,
                            ),
                            Text("All")
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AllDoctorsView(category: "Cardiology");
                        },
                      ));
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: 75,
                        child: Column(
                          children: [
                            Image.asset(
                              "images/cardio.png",
                              width: 26,
                              height: 40,
                            ),
                            Text("Cardiology")
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AllDoctorsView(category: "Medicine");
                        },
                      ));
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: 75,
                        child: Column(
                          children: [
                            Image.asset(
                              "images/medicine.png",
                              width: 26,
                              height: 40,
                            ),
                            Text("Medicine")
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AllDoctorsView(category: "General");
                        },
                      ));
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: 75,
                        child: Column(
                          children: [
                            Image.asset(
                              "images/general.png",
                              width: 26,
                              height: 40,
                            ),
                            Text("General")
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
              child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: MyColors.greenDark,
                    ),
                  ),
                );
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  // --------------------------return custom container to view data-----------------
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: MyColors.greenLight,
                      border: Border.all(
                        color: Colors.grey.shade200,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              child: FaIcon(FontAwesomeIcons.user),
                            ),
                            SizedBox(),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_half_outlined,
                                  color: MyColors.orange,
                                ),
                                Text("4.4")
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data["name"],
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "${data["category"]}, ${data["location"]} ",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        MyColors.green),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return AppointmentScreen(
                                      name: data["name"],
                                      category: data["category"],
                                    );
                                  },
                                ));
                              },
                              child: Text(
                                "Appointment",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          )),
        ),
      ],
    )));
  }
}
