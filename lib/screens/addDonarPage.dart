import 'package:flutter/material.dart';
import 'package:hackathon/assets/colors.dart';

class addDonar extends StatefulWidget {
  const addDonar({super.key});

  @override
  State<addDonar> createState() => _addDonarState();
}

class _addDonarState extends State<addDonar> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailDonateDateController = TextEditingController();
  // contollers End ----------------------------------------
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Donars"),
        elevation: 0,
        backgroundColor: MyColors.red100,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(labelText: "Location"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: numberController,
                    decoration: InputDecoration(labelText: "Phone")),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: emailDonateDateController,
                    decoration: InputDecoration(labelText: "email")),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 250,
                    height: 48,
                    color: MyColors.red100,
                    child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                            color: MyColors.white100,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
