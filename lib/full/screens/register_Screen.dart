import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:rentverse1/full/services/authservice.dart';

class RegisterFull extends StatefulWidget {
  @override
  State<RegisterFull> createState() => _RegisterFullState();
}

class _RegisterFullState extends State<RegisterFull> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "Email", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: "Password", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              controller: confirmPasswordController,
              decoration: InputDecoration(
                  labelText: "Password", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            //loading best practice so the user wont spam button click and load multiple auth
            //ternary
            loading
                ? CircularProgressIndicator()
                : Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        if (emailController.text == "" ||
                            passwordController.text == "") {
                          Get.snackbar("Missing fields",
                              "Please input all the missing fields");
                        } else if (passwordController.text !=
                            confirmPasswordController.text) {
                          Get.snackbar(
                              "Password Doesnt match", "Please make sure to ");
                        } else {
                          //call the authservice
                          User? result = await AuthService().register(
                              emailController.text,
                              passwordController.text,
                              context);
                          if (result != null) {
                            // if email does exist proceed to anoter page

                            Get.toNamed('/homescreenTest');
                            print('Sucess');
                            print(result.email);
                          }
                        }
                        setState(() {
                          loading = false;
                        });
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: (() {
                  Get.toNamed('/loginTest');
                }),
                child: Text("Already have an account? Log in here bitch")),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 20,
            ),
            // loading
            //     ? CircularProgressIndicator()
            //     : SignInButton(
            //         Buttons.Google,
            //         text: "Continue with Google",
            //         onPressed: () async {
            //           setState(() {
            //             loading = true;
            //           });
            //           await AuthService().signInWithGoogle();
            //           setState(() {
            //             loading = false;
            //           });
            //         },
            //       )
          ],
        ),
      ),
    );
  }
}
