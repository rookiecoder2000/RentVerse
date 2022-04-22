import 'package:flutter/material.dart';

class UserLists extends StatefulWidget {
  UserLists({Key? key}) : super(key: key);

  @override
  State<UserLists> createState() => _UserListsState();
}

class _UserListsState extends State<UserLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();

    //    StreamBuilder<List<Tenant>>(
    //               stream: readUsers(),
    //               builder: (context, snapshot) {
    //                 if (snapshot.hasError) {
    //                   return Text('Something wrong! ${snapshot.error}');
    //                 } else if (snapshot.hasData) {
    //                   final tenants = snapshot.data!;
    //                   return ListView(
    //                     children: tenants.map(buildUser).toList(),
    //                   );
    //                 } else {
    //                   return Center(child: CircularProgressIndicator());
    //                 }
    //               }),
    // }
  }
}
