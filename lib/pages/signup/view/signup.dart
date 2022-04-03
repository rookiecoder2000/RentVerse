import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentverse1/misc/colors.dart';
import 'package:rentverse1/misc/fontRegular.dart';
import 'package:rentverse1/misc/fonts.dart';
import 'package:rentverse1/pages/login/contoller/login_controller.dart';
import 'package:rentverse1/pages/signup/contoller/signup_controller.dart';
import 'package:rentverse1/services/servicedummy.dart';
import 'package:rentverse1/widgets/textfield.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _service = Get.put(Service());
  int _index = 0;
  double _progress = 0.3;
  final _setLinearProgress = Get.put(signUpController());
  PageController _pageViewController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20, left: 25),
                child: regularFont(24, "Welcome to",
                    colorScheme.activeStateMain, FontWeight.bold),
              ),
              Container(
                  padding: EdgeInsets.only(left: 25, bottom: 10),
                  child: titleHugeFont(
                      40, "RENTVERSE", colorScheme.activeStateMain)),
              LinearProgressIndicator(
                backgroundColor: colorScheme.inActiveState,
                color: colorScheme.purpleMuch,
                value: _progress,
              )
            ],
          ),
          Expanded(
              child: PageView(
            controller: _pageViewController,
            onPageChanged: (int index) {
              setState(() {
                _index = index;
                _progress = _setLinearProgress.lineProgress(_index);
              });
            },
            physics: NeverScrollableScrollPhysics(),
            children: [
              //FIRST PAGE
              Container(
                child: Column(
                  children: [
                    Text("PAGE 1"),
                    ElevatedButton(
                        onPressed: () {
                          _pageViewController.nextPage(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeIn);
                        },
                        child: Text("NEXT")),
                  ],
                ),
              ),
              //SECOND PAGE
              Container(
                child: Column(
                  children: [
                    Text("PAGE 2"),
                    ElevatedButton(
                        onPressed: () {
                          _pageViewController.nextPage(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeIn);
                        },
                        child: Text("NEXT")),
                    ElevatedButton(
                        onPressed: () {
                          _pageViewController.previousPage(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeIn);
                        },
                        child: Text("back"))
                  ],
                ),
              ),
              //THIRD PAGE
              Container(
                child: Column(
                  children: [
                    Text("PAGE 3"),
                    ElevatedButton(
                        onPressed: () {
                          _pageViewController.nextPage(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeIn);
                        },
                        child: Text("NEXT")),
                    ElevatedButton(
                        onPressed: () {
                          _pageViewController.previousPage(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeIn);
                        },
                        child: Text("return"))
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
