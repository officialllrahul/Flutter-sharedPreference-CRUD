import 'package:flutter/material.dart';
import 'package:shared_preference/editProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var username ;
  var password ;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('setUsername');
    String? storedPassword = prefs.getString('setPassword') ;

    username = storedUsername ?? 'Default Username';
    password = storedPassword ?? 'Default Password';
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: $username'),
            SizedBox(height: 20),
            Text('Password: $password'),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
            }, child: Text("Edit Profile"))
          ],
        ),
      ),
    );
  }
}