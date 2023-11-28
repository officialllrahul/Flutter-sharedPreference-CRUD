import 'package:flutter/material.dart';
import 'package:shared_preference/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var updateUsernameController = TextEditingController();
  var updatePasswordController = TextEditingController();
  var editusername;
  var editpassword;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('setUsername');
    String? storedPassword = prefs.getString('setPassword');

    editusername = storedUsername ?? 'Default Username';
    editpassword = storedPassword ?? 'Default Password';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: updateUsernameController,
              decoration: InputDecoration(
                hintText:'$editusername'
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: updatePasswordController,
              decoration: InputDecoration(hintText: '$editpassword'),),
            ElevatedButton(
                onPressed: () {
                  _updateData();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text("Update"))
          ],
        ),
      ),
    );
  }
  _updateData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = updateUsernameController.text.toString();
    var password = updatePasswordController.text.toString();
    prefs.setString('setUsername', username);
    prefs.setString('setPassword', password);
  }
}
