import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TenantLists extends StatefulWidget {
  TenantLists({Key? key}) : super(key: key);

  @override
  State<TenantLists> createState() => _TenantListsState();
}

class _TenantListsState extends State<TenantLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        //ListView + list tile nga naay picture
        child: Text("LISTS of tenants"),
      ),
    );
  }
}
