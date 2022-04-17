import 'package:flutter/material.dart';
import 'package:rentverse1/widgets/navigation_widget_landlords.dart';

class LandlordAppointment extends StatefulWidget {
  LandlordAppointment({Key? key}) : super(key: key);

  @override
  State<LandlordAppointment> createState() => _LandlordAppointmentState();
}

class _LandlordAppointmentState extends State<LandlordAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavigationDrawerWidgetLandlords(),
      appBar: AppBar(
        title: Text("appointment"),
      ),
    );
  }
}
