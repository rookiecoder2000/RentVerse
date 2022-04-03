import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentverse1/misc/colors.dart';
import 'package:rentverse1/misc/fontRegular.dart';
import 'package:rentverse1/misc/fonts.dart';
import 'package:rentverse1/pages/forgot_password.dart';
import 'package:rentverse1/pages/login/contoller/login_controller.dart';
import 'package:rentverse1/pages/signup/view/signup.dart';
import 'package:rentverse1/services/servicedummy.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    //reference
    final _loginController = Get.put(loginController());
    final _serviceState = Get.put(Service());
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                  width: 300,
                  height: 100,
                  child:
                      Image(image: AssetImage("assets/images/rentlogo.png"))),
              SizedBox(
                height: 40.0,
              ),
              Divider(
                thickness: 2,
                color: colorScheme.activeStateMain,
              ),

              titleHugeFont(
                  30, "RentVerse \n      Login", colorScheme.activeStateMain),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  regularFont(13, "Username", colorScheme.inputFieldsLabel,
                      FontWeight.bold),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    height: 40,
                    width: 250,
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                          focusColor: colorScheme.purpleMuch,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0))),
                    ),
                  ),
                  regularFont(13, "Password", colorScheme.inputFieldsLabel,
                      FontWeight.bold),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    height: 40,
                    width: 250,
                    child: TextField(
                      obscureText: _obscureText,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          focusColor: colorScheme.activeStateMain,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0))),
                    ),
                  ),
                ],
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(130, 40),
                      primary: colorScheme.purpleMuch),
                  onPressed: () {},
                  child: Text("Login")),

              OutlinedButton(
                onPressed: () {
                  Get.toNamed("/signup");
                },
                child: Text("Sign Up"),
                style: OutlinedButton.styleFrom(
                    minimumSize: Size(130, 40),
                    primary: colorScheme.purpleMuch,
                    side: BorderSide(color: colorScheme.purpleMuch)),
              ),
              SizedBox(
                height: 25,
              ),
              RichText(
                  text: TextSpan(
                      text: "Forgot password?  ",
                      style: TextStyle(
                        color: colorScheme.inputFieldsLabel,
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                      ),
                      children: [
                    TextSpan(
                        text: "Click here",
                        style: TextStyle(
                            color: colorScheme.purpleMuch,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed("/forgot");
                          })
                  ]))

              //make visible
              // Obx(() => Text("${_loginController.count}"))
            ],
          ),
        ),
      )),
    );
  }
}
