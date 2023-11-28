import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var getUsername;
  var getPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: (){Navigator.pushNamed(context, 'signup');},
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }

  _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getUsername= prefs.getString("setUsername");
    getPassword= prefs.getString("setPassword");
    // print("Username :$getUsername");
    // print("Password : $getPassword");
    var loginusername = usernameController.text.toString();
    var loginpassword = passwordController.text.toString();
    if (loginusername == getUsername && loginpassword == getPassword) {
      Navigator.pushReplacementNamed(context, 'home');
    }

  }
}