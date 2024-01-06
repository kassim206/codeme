import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../core/global_variable.dart';
import '../../authantication/screen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];
  Future<dynamic> fetchUser() async {
    print('fetchData called');
    const url = 'https://crm-beta-api.vozlead.in/api/v2/account/login/';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print('fetch complited');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
            child: Icon(Icons.menu)),
        title: Text('Lead List'),
        actions: [Icon(Icons.notifications)],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: deviceHeight * 0.85,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  // height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow:[BoxShadow(
                        color: Colors.black,
                        blurRadius: 6
                      )] ),
                  child: Column(children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: Text('01'),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(height: deviceHeight*0.002,),
                              Text('David Morguili',style: TextStyle(color: Colors.blue),),
                              SizedBox(height: deviceHeight*0.002,),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'example@gmail.com ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Created:05/2023 ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Mob: 974534523 ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: deviceHeight*0.02,),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: deviceWidth * 0.05,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: deviceWidth * 0.18,
                            height: deviceHeight * 0.035,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              'Flutter',
                              style: TextStyle(color: Colors.black),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: deviceWidth * 0.04,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on,color: Colors.black,size: 10),
                                  Text('Calicut',style: TextStyle(color: Colors.black,fontSize: 10),)
                                ],
                              ),
                              SizedBox(height: deviceHeight*0.02,),
                              Icon(
                                Icons.call,
                                color: Colors.black,
                                size: 30,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
