// import 'dart:ffi';
// import 'package:flutter/material.dart';
// import 'package:date_format/date_format.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:rentverse1/models/MyUser.dart';
// import 'package:rentverse1/pages/signup/signup_model.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   Rxn<User> _firebaseUser = Rxn<User>();
//   String? get user => _firebaseUser.value?.email;

//   @override
//   void onInit() {
//     _firebaseUser.bindStream(_auth.authStateChanges());
//   }

//   void createUser(String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } catch (e) {
//       Get.snackbar("Error Creating acc", "error");
//     }
//   }

//   void login(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//     } catch (e) {
//       Get.snackbar("Error signing in acc", "error");
//     }
//   }

//   void signOut() async {
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       Get.snackbar("Error signing out acc", "error");
//     }
//   }
//user obj based on firebase
//   MyUser? _userFromFireBaseUser(User? user) {
//     return user != null ? MyUser(uid: user.uid) : null;
//   }

//   //auth change user stream

//   Stream<MyUser?> get user {
//     return _auth
//         .authStateChanges()
//         .map((User? user) => _userFromFireBaseUser(user));
//   }

// //anonymous
//   Future anonymousSign() async {
//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.signInAnonymously();
//       User user = userCredential.user!;
//       return _userFromFireBaseUser(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   //sign in with email and password

//   //register with email and password

//   //signout
//}
