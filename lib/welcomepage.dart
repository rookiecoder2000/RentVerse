import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentverse1/content.dart';
import 'package:rentverse1/pages/login/view/login.dart';
import 'package:rentverse1/misc/colors.dart';
import 'package:rentverse1/misc/fontRegular.dart';
import 'package:rentverse1/misc/fonts.dart';
import 'widgets/textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({Key? key}) : super(key: key);
  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  int currentIndex = 0;
  var _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Container(
                        width: 200.0,
                        child: SvgPicture.asset(
                          contents[i].image,
                          height: 300,
                        ),
                      ),
                      Text(
                        contents[i].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Bungee',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.purpleMuch),
                      ),
                      SizedBox(height: 20),
                      Text(
                        contents[i].description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.all(40),
            width: 200,
            child: TextButton(
                child: Text(
                  currentIndex == contents.length - 1 ? "Get Started" : "Next",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Get.off(() => LoginPage());
                  }
                  _controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
                style: TextButton.styleFrom(
                    backgroundColor: colorScheme.purpleMuch)),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:
            currentIndex == index ? Colors.indigo : colorScheme.inActiveState,
      ),
    );
  }
}
