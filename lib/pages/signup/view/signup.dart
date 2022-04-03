import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
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
//container colors
  Color _containerColor1 = colorScheme.inActiveState;
  Color _containerColor2 = colorScheme.inActiveState;
  bool _clickedContainer1 = false;
  bool _clickedContainer2 = false;
  //account type

  String _accountType = "";
  //textfield controllers
  final _firstNameController = TextEditingController();
  //Controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      //contents of page 1
                      regularFont(11, "Please choose your role",
                          colorScheme.inputFieldsLabel, FontWeight.normal),
                      SizedBox(
                        height: 10,
                      ),
                      regularFont(12, "Tenant", colorScheme.guestButton,
                          FontWeight.bold),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: (() {
                          _accountType = _setLinearProgress.accountType(0);
                          // Obx(() => Text("${_loginController.count}"))
                          Get.snackbar("Account type", _accountType,
                              snackPosition: SnackPosition.TOP,
                              duration: Duration(milliseconds: 1000),
                              backgroundColor: colorScheme.inActiveState,
                              colorText: Colors.white);

                          //set bordercolor
                          setState(() {
                            _clickedContainer1 = true;
                            _clickedContainer2 = false;
                            _clickedContainer2
                                ? _containerColor2 = colorScheme.purpleMuch
                                : _containerColor2 = colorScheme.inActiveState;
                            _clickedContainer1
                                ? _containerColor1 = colorScheme.purpleMuch
                                : _containerColor1 = colorScheme.inActiveState;
                          });
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: _containerColor1, width: 2)),
                          height: 180.0,
                          width: 340.0,
                          child: Row(children: [
                            Expanded(
                                child: SvgPicture.asset(
                                    "assets/images/ChooseHouse.svg")),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: regularFont(
                                  12,
                                  "I'm looking for a place \n to rent.",
                                  colorScheme.guestButton,
                                  FontWeight.normal),
                            )
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      regularFont(12, "Landlord", colorScheme.guestButton,
                          FontWeight.bold),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: (() {
                          _accountType = _setLinearProgress.accountType(1);
                          Get.snackbar("Account type", _accountType,
                              snackPosition: SnackPosition.TOP,
                              duration: Duration(milliseconds: 1000),
                              backgroundColor: colorScheme.inActiveState,
                              colorText: Colors.white);
                          //set bordercolor
                          setState(() {
                            _clickedContainer2 = true;
                            _clickedContainer1 = false;
                            _clickedContainer1
                                ? _containerColor1 = colorScheme.purpleMuch
                                : _containerColor1 = colorScheme.inActiveState;
                            _clickedContainer2
                                ? _containerColor2 = colorScheme.purpleMuch
                                : _containerColor2 = colorScheme.inActiveState;
                          });
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: _containerColor2, width: 2)),
                          height: 180.0,
                          width: 340.0,
                          child: Row(children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: regularFont(
                                  12,
                                  "I’m going to enlist my \n boarding  house units \n for renting services.",
                                  colorScheme.guestButton,
                                  FontWeight.normal),
                            ),
                            Expanded(
                                child: SvgPicture.asset(
                                    "assets/images/ForRent.svg")),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                minimumSize: Size(120, 35),
                                textStyle: TextStyle(
                                    color: colorScheme.activeStateMain),
                                side: BorderSide(
                                    width: 1.0,
                                    color: colorScheme.activeStateMain)),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              "Return",
                              style:
                                  TextStyle(color: colorScheme.activeStateMain),
                            ),
                          ),

                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(120, 35),
                                  primary: colorScheme.purpleMuch,
                                  side: BorderSide(
                                      width: 1.0,
                                      color: colorScheme.activeStateMain)),
                              onPressed: () {
                                if (_accountType == "") {
                                  //TODO: Customize dialogue and make it reusable widget
                                  Get.defaultDialog(
                                      title: "Select Account Type",
                                      middleText:
                                          "Could not proceed to next page, please choose account type first by  tapping a container.",
                                      textConfirm: "Got it",
                                      confirmTextColor: Colors.white,
                                      radius: 10,
                                      buttonColor: Colors.lightGreen,
                                      onConfirm: () {
                                        Get.back();
                                      });
                                } else {
                                  _pageViewController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                }
                              },
                              child: Text(
                                "Continue",
                                style: TextStyle(color: Colors.white),
                              )),

                          //button
                          //button
                        ],
                      )
                    ],
                  ),
                ),
              ),
              //SECOND PAGE
              Container(
                child: Container(
                  child: Column(
                    children: [
                      TextField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          controller: _firstNameController,
                          decoration: InputDecoration(
                              hintText: "hint",
                              labelText: "Firstname",
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(),
                              suffixIcon: _firstNameController.text.isEmpty
                                  ? Container(
                                      width: 0,
                                    )
                                  : IconButton(
                                      onPressed: () =>
                                          _firstNameController.clear(),
                                      icon: Icon(Icons.close))))
                    ],
                  ),
                ),
              ),
              //THIRD PAGE
              Container(
                child: Column(
                  children: [
                    //contents of page 3
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
