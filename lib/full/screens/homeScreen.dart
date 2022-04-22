import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rentverse1/full/services/authservice.dart';

class HomeScreen extends StatelessWidget {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: [
          TextButton.icon(
            onPressed: (() async {
              await AuthService().signOut();
            }),
            icon: Icon(Icons.logout),
            label: Text("Sign Out"),
            style: TextButton.styleFrom(primary: Colors.white),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  //creating collection if nonexistent then auto generate
                  CollectionReference users =
                      firebaseFirestore.collection('users');
                  //add accepts data in MAP { } in key value pairs

                  //basta add kay auto generated
                  // await users.add({
                  //   'name': 'Rahul',
                  // });
                  //specified on our own but not a UNIQUE ID
                  await users.doc('0145').set({'name': "Google x"});
                },
                child: Text('Add Data to firestore')),
            ElevatedButton(
                onPressed: () async {
                  CollectionReference users =
                      firebaseFirestore.collection('users');
                  //read the entire collection
                  // QuerySnapshot allResults = await users.get();
                  // allResults.docs.forEach((DocumentSnapshot result) {
                  //   print(result.data());
                  // });

                  //read specific values
                  DocumentSnapshot result = await users.doc('0145').get();
                  print(result.data());

                  //read but a stream + real time
                  // users.doc('0145').snapshots().listen((result) {
                  //   print(result.data());
                  // });
                },
                child: Text('Read Data from firestore')),
            ElevatedButton(
                onPressed: () async {
                  await firebaseFirestore
                      .collection('users')
                      .doc('0145')
                      .update({
                    'name': "Di na sya google",
                  });
                },
                child: Text("Update Data in Firestore")),
          ],
        ),
      ),
    );
  }
}
