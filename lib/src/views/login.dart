import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shopping_list/src/state/user_provider.dart';
import 'home_page.dart';
import '../models/user/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Uri loginUrl = Uri.parse("https://simplelist.de:8080/user/login");

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> _login(String username, String password) async {
    final res = await http.post(
      loginUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );
    if (res.statusCode == 200) {
      return convert.jsonDecode(res.body) as Map<String, dynamic>;
    } else {
      throw Exception("Failed to login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("simplelist"),
        backgroundColor: Colors.black,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset('lib/src/assets/check-list3.png')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: userController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: 'Email',
                  hintText: 'Enter valid email id.',
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).focusColor,
                      width: 2,
                    ),
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).focusColor,
                      width: 2,
                    ),
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final String username = userController.text;
              final String password = passwordController.text;
              final json = await _login(username, password);
              User user = User.fromJson(json);
              context.read<UserProvider>().setUser(user);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const HomePage()));
            },
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Login',
              style: Theme.of(context).textTheme.button,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 30.0)),
          const Text('New User? Create Account')
        ],
      ),
    );
  }
}
