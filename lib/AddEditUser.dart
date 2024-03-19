import 'package:crud_api/Usermodel.dart';
import 'package:crud_api/myapi.dart';
import 'package:flutter/material.dart';

class AddEditPage extends StatefulWidget {
  AddEditPage({super.key, required this.map});

  Map<String, dynamic>? map;

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var ageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstnameController.text =
        widget.map != null ? widget.map!["Firstname"] : "";
    lastnameController.text = widget.map != null ? widget.map!["Lastname"] : "";
    ageController.text = widget.map != null ? widget.map!["Age"] : "";
  }

  @override
  Widget build(BuildContext context) {
    String name = widget.map == null ? "Add" : "Update";
    return Scaffold(
        appBar: AppBar(title: Text("$name User")),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: firstnameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelText: "First Name",
                      hintText: "Enter First Name",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: lastnameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelText: "Last Name",
                      hintText: "Enter Last Name",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: ageController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelText: "Age",
                      hintText: "Enter Age",
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (widget.map == null) {
                        Insertrecord().then((value) {
                          Navigator.of(context).pop();
                        });
                      } else {
                        Upadaterecord(widget.map!["id"]).then((value) {
                          Navigator.of(context).pop();
                        });
                      }
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Future<void> Upadaterecord(String id) async {
    UserModel umodel = UserModel();
    umodel.Firstname = firstnameController.text;
    umodel.Lastname = lastnameController.text;
    umodel.Age = ageController.text;

    Map<String, dynamic> map = umodel.Convert();
    await MyApi().Updateuser(id, map);
  }

  Future<void> Insertrecord() async {
    // Map<String, dynamic> map = {};
    //
    // map["Firstname"] = firstnameController.text;
    // map["Lastname"] = lastnameController.text;
    // map["Age"] = ageController.text;

    UserModel umodel = UserModel();
    umodel.Firstname = firstnameController.text;
    umodel.Lastname = lastnameController.text;
    umodel.Age = ageController.text;

    Map<String, dynamic> map = umodel.Convert();

    await MyApi().Insertuser(map);
  }

// Future<void> Upadaterecord(String id) async {
//   // Map<String, dynamic> map = {};
//   //
//   // map["Firstname"] = firstnameController.text;
//   // map["Lastname"] = lastnameController.text;
//   // map["Age"] = ageController.text;
//
//   UserModel umodel = UserModel();
//   umodel.Firstname = firstnameController.text;
//   umodel.Lastname = lastnameController.text;
//   umodel.Age = ageController.text;
//
//   Map<String, dynamic> map = umodel.Convert();
//
//   await MyApi().Updateuser(id, map);
// }
}

// if (widget.map == null) {
// Insertrecord().then((value) {
// Navigator.of(context).pop();
// });
// } else {
// Upadaterecord(widget.map!["id"]).then((value) {
// Navigator.of(context).pop();
// });
// }
