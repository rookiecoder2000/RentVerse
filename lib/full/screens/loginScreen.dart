import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentverse1/full/services/authservice.dart';

class LoginScreenTest extends StatefulWidget {
  @override
  State<LoginScreenTest> createState() => _LoginScreenTestState();
}

class _LoginScreenTestState extends State<LoginScreenTest> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
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
                        } else {
                          //call the authservice
                          User? result = await AuthService().login(
                              emailController.text,
                              passwordController.text,
                              context);
                          if (result != null) {
                            Get.toNamed('/homescreenTest');
                            print('Sucess');
                            print(result.email);
                          } else {
                            print("user not found!");
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
          ],
        ),
      ),
    );
  }
}
