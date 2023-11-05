import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/assets/colors.dart';

class AllDoctorsView extends StatefulWidget {
  final String category;
  const AllDoctorsView({super.key, required this.category});

  @override
  State<AllDoctorsView> createState() => _AllDoctorsViewState();
}

class _AllDoctorsViewState extends State<AllDoctorsView> {
  // final Stream<QuerySnapshot> _usersStream =
  //     FirebaseFirestore.instance.collection('doctors').snapshots();

  late Stream<QuerySnapshot> _usersStream;

  @override
  void initState() {
    super.initState();
    if (widget.category == "Cardiology") {
      _usersStream = FirebaseFirestore.instance
          .collection('doctors')
          .where("category", isEqualTo: "Cardiology")
          .snapshots();
    } else if (widget.category == "Medicine") {
      _usersStream = FirebaseFirestore.instance
          .collection('doctors')
          .where("category", isEqualTo: "Medicine")
          .snapshots();
    } else if (widget.category == "General") {
      _usersStream = FirebaseFirestore.instance
          .collection('doctors')
          .where("category", isEqualTo: "General")
          .snapshots();
    } else if (widget.category == "All") {
      _usersStream =
          FirebaseFirestore.instance.collection('doctors').snapshots();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.category);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Top Doctors - ${widget.category}"),
        elevation: 0,
        backgroundColor: MyColors.green,
      ),
      body: Container(
          child: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    color: MyColors.green,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                            backgroundColor: MaterialStateProperty.all<Color>(
                                MyColors.green),
                          ),
                          onPressed: () {},
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
    ));
    ;
  }
}
