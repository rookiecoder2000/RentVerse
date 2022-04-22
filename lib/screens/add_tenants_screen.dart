import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rentverse1/widgets/custome_datepicker.dart';
import 'package:rentverse1/widgets/customtextfield.dart';

class AddTenantsScreen extends StatefulWidget {
  const AddTenantsScreen({Key? key}) : super(key: key);

  @override
  State<AddTenantsScreen> createState() => _AddTenantsScreenState();
}

class _AddTenantsScreenState extends State<AddTenantsScreen> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  DateTime? _dateOfBirth;
  String dateformatter = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Add tenant"), centerTitle: true, actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            //todo
          },
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            CustomTextFormField(
              controller: _userController,
              txtLabel: 'User Name',
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: _passcontroller,
              txtLabel: 'Password',
              isObscure: true,
            ),
            SizedBox(
              height: 10,
            ),
            CustomDatePicker(
                controller: _dateController,
                textLabel: "Date of Birth",
                callback: () {
                  pickDateofBirth(context);
                }),
            ElevatedButton(
                onPressed: () {
                  //

                  Tenant tenant = Tenant(
                      name: _userController.text,
                      age: _passcontroller.text,
                      birthday: dateformatter);
                  createUser(tenant);
                  Get.toNamed('/listpage');
                },
                child: Text("ADD")),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/listpage');
                },
                child: Text("New firebase jutsu")),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/read');
                },
                child: Text("READ")),
          ],
        ),
      ),
    );
  }

  Future<void> pickDateofBirth(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        //if the date of birth is null then
        initialDate: _dateOfBirth ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (context, child) => Theme(
            data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
                    primary: Colors.pink,
                    onPrimary: Colors.white,
                    onSurface: Colors.black)),
            child: child ?? const Text('')));
    if (newDate == null) {
      return;
    }
    setState(() {
      _dateOfBirth = newDate;
      dateformatter = DateFormat('dd/MM/yyyy').format(newDate);
      _dateController.text = dateformatter;
    });
  }

  Widget buildUser(Tenant tenant) => ListTile(
        leading: CircleAvatar(child: Text('${tenant.age}')),
        title: Text(tenant.name),
        subtitle: Text(tenant.birthday),
      );
  Stream<List<Tenant>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Tenant.fromJson(doc.data())).toList());

  Future createUser(Tenant tenant) async {
    //reference document
//collection = rag table sa sql tas ang doc kay rag primary key sa sql
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    tenant.id = docUser.id;
//ang e add

    final json = tenant.toJson();
    await docUser.set(json);
    // final json = {
    //   'name': name,
    //   'gender': 'Male',
    //   'birthday': DateTime(2000, 07, 07),
    // };
  }
}

class Tenant {
  String id;
  final String name;
  final String age;
  final String birthday;

  Tenant(
      {this.id = '',
      required this.name,
      required this.age,
      required this.birthday});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'birthday': birthday,
      };

  static Tenant fromJson(Map<String, dynamic> json) => Tenant(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      birthday: json['birthday']);
}
