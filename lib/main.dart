import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rentverse1/full/screens/homeScreen.dart';
import 'package:rentverse1/full/screens/loginScreen.dart';
import 'package:rentverse1/full/screens/register_Screen.dart';
import 'package:rentverse1/full/services/authservice.dart';
import 'package:rentverse1/pages/forgot_password.dart';
import 'package:rentverse1/pages/login/view/login.dart';
import 'package:rentverse1/pages/signup/view/signup.dart';
import 'package:rentverse1/screens/add_tenants_screen.dart';
import 'package:rentverse1/screens/allusers.dart';

import 'package:rentverse1/screens/landlords_appointment.dart';
import 'package:rentverse1/screens/landlords_profile.dart';
import 'package:rentverse1/screens/landlords_tenantslist.dart';
import 'package:rentverse1/screens/landlords_ui.dart';
import 'package:rentverse1/screens/read.dart';
import 'package:rentverse1/screens/signup_success.dart';
import 'package:rentverse1/screens/tenants_ui.dart';
import 'package:rentverse1/splash_screen.dart';
import 'package:rentverse1/welcomepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      getPages: [
        GetPage(name: "/login", page: () => LoginPage()),
        GetPage(name: "/signup", page: () => SignUp()),
        GetPage(name: "/splash", page: () => SplashScreen()),
        GetPage(name: "/welcome", page: () => welcomePage()),
        GetPage(name: "/forgot", page: () => ForgotPassword()),
        GetPage(name: "/success", page: () => SignupSuccess()),
        GetPage(name: "/landlord", page: () => HomeScreenLandlords()),
        GetPage(name: "/tenant", page: () => HomeScreenTenants()),
        GetPage(name: "/landlordProfile", page: () => LandlordProfile()),
        GetPage(
            name: "/landlordAppointments", page: () => LandlordAppointment()),
        GetPage(name: "/landlordTenantsList", page: () => TenantLists()),

        //testing routes
        GetPage(name: "/test", page: () => AddTenantsScreen()),
        GetPage(name: '/listpage', page: () => UserLists()),
        GetPage(name: '/read', page: () => ReadAuth()),
        GetPage(name: '/regfull', page: () => RegisterFull()),
        GetPage(name: '/loginTest', page: () => LoginScreenTest()),
        GetPage(name: '/homescreenTest', page: () => HomeScreen())
      ],

      // initialRoute: "/splash",
      home: StreamBuilder(
        //check if already logged in or not
        stream: AuthService().firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          }
          return RegisterFull();
        },
      ),
    );
  }
}
