import 'dart:convert';
import 'package:decode/core/global_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants.dart';
import '../../home/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
              width: deviceWidth * deviceWidth,
              height: deviceHeight * 0.4,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100))),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100)),
                child: Image.asset(
                  'assets/img/dec1.jpg',
                  fit: BoxFit.cover,
                ),
              )),
          Container(
            color: Colors.white,
            width: deviceWidth * 0.9,
            height: deviceHeight * 0.5,
            child: Column(
              children: [
                Text(
                  'Sign In         ',
                  style: TextStyle(fontSize: 30, color: Colors.blue),
                ),
                Text(
                  'Welcome back! please enter your credentials to login',
                  style: TextStyle(fontSize: 10),
                ),
                Container(
                  height: deviceHeight * .065,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: deviceWidth * .028),
                    child: TextFormField(
                      controller: emailController,
                      style: GoogleFonts.lexend(
                          color: Color(0xff9E9E9E),
                          fontWeight: FontWeight.w500,
                          fontSize: deviceWidth * .035),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        hintText: 'username',
                        hintStyle: GoogleFonts.lexend(
                            color: Color(0xff9E9E9E),
                            fontWeight: FontWeight.w500,
                            fontSize: deviceWidth * .035),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * .0275,
                ),
                Container(
                  height: deviceHeight * .065,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: deviceWidth * .028),
                    child: TextFormField(
                      controller: passwordController,
                      style: GoogleFonts.lexend(
                          color: Color(0xff9E9E9E),
                          fontWeight: FontWeight.w500,
                          fontSize: deviceWidth * .035),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        hintText: 'password',
                        hintStyle: GoogleFonts.lexend(
                            color: Color(0xff9E9E9E),
                            fontWeight: FontWeight.w500,
                            fontSize: deviceWidth * .035),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * .0275,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Forgot your ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Password? ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      // fetchUser();
                      String username = emailController.text;
                      String password = passwordController.text;
                      login(username, password, context);
                    },
                    child: Text(
                      '             Sign In                ',
                      style: TextStyle(color: Colors.black),
                    )),
                SizedBox(
                  height: deviceHeight * .0275,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have any accounts? ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Sign Up ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

login(String username, String password, BuildContext context) async {
  var url = 'https://crm-beta-api.vozlead.in/api/v2/account/login/';
  var body = json.encode({"username": username, "password": password});

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json', // Add this line
      },
      body: body,
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    } else {
      print('Login failed with status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Error during login: $e');
  }
}
