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
  // getUser(String email, String password) async {
  //   await ref.read(authControllerProvider.notifier)
  //       .getUser(email, password, _btnController1, context);
  // }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<dynamic> users = [];
  Future<void> fetchUser() async {
    print('fetchData called');
    const url = 'https://crm-beta-api.vozlead.in/api/v2/account/login/';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);

      setState(() {
        emailController.text = json['email'];
        passwordController.text = json['password'];
      });

      print('fetch completed');
    } else {
      print('Failed to fetch data. Error code: ${response.statusCode}');
      // Handle error if necessary
    }
  }

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
            child: Image.asset(
              Constants.log,
              width: deviceWidth * 0.3,
              height: deviceHeight * 0.3,
            ),
          ),
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
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child:
                  // Text(
                  //   'Email: ${emailController.text}',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(left: deviceWidth * .028),
                    child: TextFormField(
                      controller: emailController,
                      style: GoogleFonts.lexend(
                          color: Color(0xff9E9E9E),
                          fontWeight: FontWeight.w500,
                          fontSize: deviceWidth * .035),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        hintText:  'Email: ${emailController.text}',
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
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child:
                  // Text(
                  //   'Password: ${passwordController.text}',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(left: deviceWidth * .028),
                    child: TextFormField(
                      controller: passwordController,
                      style: GoogleFonts.lexend(
                          color: Color(0xff9E9E9E),
                          fontWeight: FontWeight.w500,
                          fontSize: deviceWidth * .035),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        hintText:'Password: ${passwordController.text}',
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
                      fetchUser();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
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
