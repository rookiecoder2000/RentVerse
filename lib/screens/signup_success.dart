import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentverse1/misc/fontRegular.dart';
import 'package:rentverse1/misc/fonts.dart';
import 'package:rentverse1/misc/colors.dart';

class SignupSuccess extends StatelessWidget {
  const SignupSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                  width: 250,
                  height: 200,
                  child: Image.asset("assets/images/congrats.png")),
              SizedBox(
                height: 30,
              ),
              titleHugeFont(20, "Registration Success", Colors.black),
              SizedBox(
                height: 15,
              ),
              regularFont(13, "You can continue now to Login page.",
                  colorScheme.inputFieldsLabel, FontWeight.normal),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(top: 70),
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: colorScheme.purpleMuch),
                      onPressed: () {
                        Get.toNamed("/login");
                      },
                      child: Text("Continue to Login")))
            ],
          ),
        )),
      ),
    );
  }
}
