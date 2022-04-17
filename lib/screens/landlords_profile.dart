import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentverse1/misc/colors.dart';
import 'package:rentverse1/misc/fontRegular.dart';
import 'package:rentverse1/misc/fonts.dart';

class LandlordProfile extends StatelessWidget {
  const LandlordProfile({Key? key}) : super(key: key);

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
      body: Column(
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
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          Column(
            children: [Text("test")],
          )
        ],
      ),
    );
  }
}
