import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentverse1/misc/colors.dart';
import 'package:rentverse1/misc/fontRegular.dart';
import 'package:rentverse1/misc/fonts.dart';
import 'package:rentverse1/widgets/textfield.dart';

class LandlordProfile extends StatefulWidget {
  LandlordProfile({Key? key}) : super(key: key);

  @override
  State<LandlordProfile> createState() => _LandlordProfileState();
}

class _LandlordProfileState extends State<LandlordProfile> {
  //textEditingControllers
  TextEditingController _firstNameController = TextEditingController();

  TextEditingController _lastNameController = TextEditingController();

  TextEditingController _contactNumber = TextEditingController();

  TextEditingController _address = TextEditingController();

  TextEditingController _occupation = TextEditingController();

  TextEditingController _age = TextEditingController();

  TextEditingController _password = TextEditingController();
  bool isEnabled = false;
  bool saveButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: colorScheme.purpleMuch,
        title: Text(
          "Profile Manager",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: colorScheme.purpleMuch,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(220),
                    // bottomLeft: Radius.circular(220)
                  )),
              width: double.maxFinite,
              child: Column(
                children: [
                  regularFont(
                      25, "Joah Cyrus Perez", Colors.white, FontWeight.bold),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                          icon: Icon(Icons.camera),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.pinkAccent),
                          onPressed: () {
                            Get.snackbar("Feature not Available yet", "",
                                snackPosition: SnackPosition.TOP,
                                duration: Duration(milliseconds: 3000),
                                backgroundColor: Colors.red,
                                colorText: Colors.white);
                          },
                          label: Text("Upload")),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),

                  //firstname
                  TextField(
                    readOnly: isEnabled,
                    controller: _firstNameController,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        label: Text("Firstname"),
                        isDense: true,
                        prefixIconColor: colorScheme.inActiveState,
                        //iconColor: colorScheme.activeStateMain,
                        prefixIcon: Icon(
                          Icons.person,
                          size: 25,
                          color: colorScheme.inActiveState,
                        ),
                        focusColor: colorScheme.activeStateMain,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorScheme.activeStateMain,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: 2,
                          color: colorScheme.purpleMuch,
                        ))),
                  ),
                  //lastname
                  TextField(
                    readOnly: isEnabled,
                    controller: _lastNameController,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        label: Text("Lastname"),
                        isDense: true,
                        prefixIconColor: colorScheme.inActiveState,
                        //iconColor: colorScheme.activeStateMain,
                        prefixIcon: Icon(
                          Icons.person,
                          size: 25,
                          color: colorScheme.inActiveState,
                        ),
                        focusColor: colorScheme.purpleMuch,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorScheme.purpleMuch,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: 2,
                          color: colorScheme.purpleMuch,
                        ))),
                  ),
                  //contact number
                  TextField(
                    readOnly: isEnabled,
                    controller: _contactNumber,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        label: Text("Contact"),
                        isDense: true,
                        prefixIconColor: colorScheme.inActiveState,
                        //iconColor: colorScheme.activeStateMain,
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 25,
                          color: colorScheme.inActiveState,
                        ),
                        focusColor: colorScheme.activeStateMain,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorScheme.activeStateMain,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: 2,
                          color: colorScheme.purpleMuch,
                        ))),
                  ),
                  TextField(
                    readOnly: isEnabled,
                    controller: _address,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        label: Text("Address"),
                        isDense: true,
                        prefixIconColor: colorScheme.inActiveState,
                        //iconColor: colorScheme.activeStateMain,
                        prefixIcon: Icon(
                          Icons.place,
                          size: 25,
                          color: colorScheme.inActiveState,
                        ),
                        focusColor: colorScheme.activeStateMain,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorScheme.activeStateMain,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: 2,
                          color: colorScheme.purpleMuch,
                        ))),
                  ),
                  TextField(
                    readOnly: isEnabled,
                    controller: _occupation,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        label: Text("Occupation"),
                        isDense: true,
                        prefixIconColor: colorScheme.inActiveState,
                        //iconColor: colorScheme.activeStateMain,
                        prefixIcon: Icon(
                          Icons.work,
                          size: 25,
                          color: colorScheme.inActiveState,
                        ),
                        focusColor: colorScheme.activeStateMain,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorScheme.activeStateMain,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: 2,
                          color: colorScheme.purpleMuch,
                        ))),
                  ),
                  TextField(
                    readOnly: isEnabled,
                    controller: _age,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        label: Text("Age"),
                        isDense: true,
                        prefixIconColor: colorScheme.inActiveState,
                        //iconColor: colorScheme.activeStateMain,
                        prefixIcon: Icon(
                          Icons.calendar_month,
                          size: 25,
                          color: colorScheme.inActiveState,
                        ),
                        focusColor: colorScheme.activeStateMain,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorScheme.activeStateMain,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: 2,
                          color: colorScheme.purpleMuch,
                        ))),
                  ),
                  TextField(
                    readOnly: isEnabled,
                    controller: _password,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        label: Text("Password"),
                        isDense: true,
                        prefixIconColor: colorScheme.inActiveState,
                        //iconColor: colorScheme.activeStateMain,
                        prefixIcon: Icon(
                          Icons.visibility,
                          size: 25,
                          color: colorScheme.inActiveState,
                        ),
                        focusColor: colorScheme.activeStateMain,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorScheme.activeStateMain,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: 2,
                          color: colorScheme.purpleMuch,
                        ))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 40),
                            primary: Color.fromARGB(255, 32, 15, 180)),
                        onPressed: () {
                          setState(() {
                            isEnabled = !isEnabled;
                          });
                        },
                        child: Text("Edit Profile"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 40),
                            primary: colorScheme.purpleMuch),
                        onPressed: () {
                          Get.snackbar("All Changes Saved! ", "",
                              snackPosition: SnackPosition.TOP,
                              duration: Duration(milliseconds: 3000),
                              backgroundColor: Colors.green,
                              colorText: Colors.white);
                          setState(() {});
                        },
                        child: Text("Save Changes"),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
