import 'package:flutter/material.dart';
import 'package:rentverse1/misc/colors.dart';

class HomeScreenTenants extends StatelessWidget {
  const HomeScreenTenants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.interface,
      body: Text("TENANTS"),
    );
  }
}
