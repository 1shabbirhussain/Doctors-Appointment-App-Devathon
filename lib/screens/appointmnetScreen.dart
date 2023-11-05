import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/assets/colors.dart';
import 'package:intl/intl.dart';

class AppointmentScreen extends StatefulWidget {
  final String name;
  final String category;
  const AppointmentScreen(
      {super.key, required this.name, required this.category});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Appointment",
          style: TextStyle(color: MyColors.black100),
        ),
        backgroundColor: MyColors.white100,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: FaIcon(FontAwesomeIcons.user),
                    ),
                    Text(
                      "Dr. ${widget.name}",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${widget.category}",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[500]),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: MyColors.green,
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: MyColors.white100,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Text(
                            "350+",
                            style: GoogleFonts.poppins(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFF9A9A)),
                          ),
                          Text(
                            "Pateints",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: MyColors.white100,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Text(
                            "15+",
                            style: GoogleFonts.poppins(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: MyColors.green),
                          ),
                          Text(
                            "Exp. Years",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: MyColors.white100,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Text(
                            "284+",
                            style: GoogleFonts.poppins(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff9DEAC0)),
                          ),
                          Text(
                            "Reviews",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Doctor",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Dr. Maria Waston is the top most Cardiologist specialist in Nanyang Hospotalat London. She is available for private consultation.",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Schedule",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100, // Set the height as needed
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          final date =
                              DateTime.now().add(Duration(days: index));
                          final day = DateFormat('E').format(date);
                          final formattedDate = DateFormat('d').format(date);

                          return Padding(
                            padding: EdgeInsets.all(
                                8), // Adjust the spacing as needed
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 100, // Set the width as needed
                                decoration: BoxDecoration(
                                  color: MyColors.white100,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Text(
                                      formattedDate,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      day,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Visiting Hours",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text("11:00 AM"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text("02:00 PM"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text("12:00 AM"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text("03:00 PM"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text("01:00 PM"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text("04:00 PM"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.green,
                ),
                height: 40,
                width: 300,
                child: Center(
                    child: Text(
                  "Book Appointment",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: MyColors.white100),
                )),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
