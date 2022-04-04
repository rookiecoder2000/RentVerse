import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _completeAddressController = TextEditingController();
  final _occupationController = TextEditingController();
  final _positionController = TextEditingController();
  bool _isFilledUp = false;
  //Controller
  bool _obscureText = true;
  bool _obscureText2 = true;
  //date
  DateTime _dateTime = DateTime.now();
  String _formattedDate = "";
  var age;
  var gender;
  var day, year, month;
  var hint = "mm/dd/yyyy";
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        titleHugeFont(20, "Please enter credentials",
                            colorScheme.activeStateMain),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 10),
                          child: TextField(
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.done,
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: "Firstname",
                                border: OutlineInputBorder(),
                              )),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 10),
                          child: TextField(
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.done,
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: "Last Name",
                                border: OutlineInputBorder(),
                              )),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 10),
                          child: TextField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(11)
                              ],
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              controller: _contactNumberController,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: "Contact Number",
                                border: OutlineInputBorder(),
                              )),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 10),
                          child: TextField(
                              keyboardType: TextInputType.streetAddress,
                              textInputAction: TextInputAction.done,
                              controller: _completeAddressController,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: "Complete Address",
                                border: OutlineInputBorder(),
                              )),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 10),
                          child: TextField(
                              textInputAction: TextInputAction.done,
                              controller: _occupationController,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: "Occupation",
                                border: OutlineInputBorder(),
                              )),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 10),
                          child: TextField(
                              textInputAction: TextInputAction.done,
                              controller: _positionController,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: "Position",
                                border: OutlineInputBorder(),
                              )),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 10),
                          child: TextField(
                              readOnly: true,
                              controller: _ageController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: (() async {
                                    //
                                    DateTime? _birthDate = await showDatePicker(
                                        context: context,
                                        initialDate: _dateTime,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now());

                                    if (_birthDate != null) {
                                      setState(() {
                                        final DateFormat formatter =
                                            DateFormat('MM/dd/yyyy');

                                        _formattedDate =
                                            formatter.format(_birthDate);
                                        hint = _formattedDate;
                                        int currentYear = _dateTime.year;
                                        day = int.parse(DateFormat("dd")
                                            .format(_birthDate));
                                        year = int.parse(DateFormat("yyyy")
                                            .format(_birthDate));
                                        month = int.parse(DateFormat("MM")
                                            .format(_birthDate));

                                        age = currentYear - year;
                                        if (age >= 18) {
                                          _ageController.text = age.toString();
                                        } else {
                                          Get.defaultDialog(
                                              title: "Age Inappropriate",
                                              middleText:
                                                  "Age must be at least 18+.",
                                              textConfirm: "Got it",
                                              confirmTextColor: Colors.white,
                                              radius: 10,
                                              buttonColor: Colors.lightGreen,
                                              onConfirm: () {
                                                Get.back();
                                              });
                                        }
                                      });
                                    }
                                  }),
                                  icon: Icon(
                                    Icons.calendar_month,
                                    size: 16,
                                  ),
                                ),
                                isDense: true,
                                labelText: "Age",
                                border: OutlineInputBorder(),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Row(
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
                                  _pageViewController.previousPage(
                                      duration: Duration(milliseconds: 1000),
                                      curve: Curves.easeIn);
                                },
                                child: Text(
                                  "Return",
                                  style: TextStyle(
                                      color: colorScheme.activeStateMain),
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
                                    //nullChecker
                                    _isFilledUp =
                                        _setLinearProgress.nullChecker(
                                            _firstNameController.text
                                                .toString(),
                                            _lastNameController.text.toString(),
                                            _contactNumberController.text
                                                .toString(),
                                            _completeAddressController.text
                                                .toString(),
                                            _occupationController.text
                                                .toString(),
                                            _positionController.text.toString(),
                                            _ageController.text.toString());
                                    if (_isFilledUp) {
                                      //storeMethod

                                      _pageViewController.nextPage(
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeIn);
                                    } else {
                                      Get.defaultDialog(
                                          title: "Missing Credentials",
                                          middleText:
                                              "Please fill up all the fields to continue.",
                                          textConfirm: "Got it",
                                          confirmTextColor: Colors.white,
                                          radius: 10,
                                          buttonColor: Colors.lightGreen,
                                          onConfirm: () {
                                            Get.back();
                                          });
                                    }
                                  },
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(color: Colors.white),
                                  )),

                              //button
                              //button
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //THIRD PAGE
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //contents of page 3
                      Container(
                        margin: EdgeInsets.only(left: 50, top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            titleHugeFont(15, "Hang in there,",
                                colorScheme.activeStateMain),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            child: SvgPicture.asset("assets/images/Done.svg"),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 50, bottom: 40),
                            child: titleHugeFont(15, "Almost Done!",
                                colorScheme.activeStateMain),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 35),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  titleHugeFont(
                                      20, "Create ACcount", Colors.white),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                                decoration: new InputDecoration(
                                  hintText: 'Email Address',
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.5),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.5),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              child: TextField(
                                obscureText: _obscureText2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                                decoration: new InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText2 = !_obscureText2;
                                      });
                                    },
                                    child: Icon(
                                      //Ternary
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.5),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.5),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              child: TextField(
                                obscureText: _obscureText,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                                decoration: new InputDecoration(
                                  hintText: 'Re-type password',
                                  hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(
                                      //Ternary
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.5),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.5),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(150, 40),
                                  primary: Colors.pinkAccent),
                              onPressed: () {},
                              child: Text("Confirm"),
                            ),
                            // OutlinedButton(
                            //   style: OutlinedButton.styleFrom(
                            //       minimumSize: Size(120, 35),
                            //       textStyle: TextStyle(
                            //           color: colorScheme.activeStateMain),
                            //       side: BorderSide(
                            //           width: 1.0,
                            //           color: colorScheme.activeStateMain)),
                            //   onPressed: () {
                            //     _pageViewController.previousPage(
                            //         duration: Duration(milliseconds: 1000),
                            //         curve: Curves.easeIn);
                            //   },
                            //   child: Text(
                            //     "Return",
                            //     style: TextStyle(
                            //         color: colorScheme.activeStateMain),
                            //   ),
                            // ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: colorScheme.interface,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(120))),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

// suffixIcon: _firstNameController.text.isEmpty
//                                       ? IconButton(
//                                           onPressed: () {}, icon: Icon(null))
//                                       : IconButton(
//                                           onPressed: () =>
//                                               _firstNameController.clear(),
//                                           icon: Icon(Icons.close)
//                                           )
