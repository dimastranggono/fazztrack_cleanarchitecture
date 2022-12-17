import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'UI/view/Home.dart';
import 'UI/viewModel/stateGetX.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {


   stateGetX controller = Get.put(stateGetX());//menambahkan dependencies pada class ini untuk state management getX

  String emailCntrl;
  String passCntrl;
  // var _dio = Dio(); //inisialisasi DIO package untuk handle API

  // Future<List> getDataFromApi() async {
  //   // cara mengambil data berupa List
  //   List dataSet = [];
  //   var result = await _dio.get("https://jsonplaceholder.typicode.com/users");
  //   dataSet.add(result.data);
  //   return dataSet[0];
  //   // print('disini $result');
  // }

  // Future postDatatoApi({String email, String password}) async {
  //   // cara post data, dengan parameter email dan password
  //   var result = await _dio.post("http://23.20.237.176:8000/auth/login", data: {
  //     "email": email,
  //     "password": password,
  //   });
  //   return result;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFCFF),
      body: GetBuilder<stateGetX>(
        builder: (objectX) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(143, 105, 130, 60),
                child: Text(
                  'Zwallet',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff6379F4)),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 40, 16, 59),
                width: 400,
                height: 610,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xffEFF5F5)),
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Login to your existing account to access all the features in Zwallet.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    FutureBuilder(
                      builder: (context, snapshot) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 53),
                              child: TextField(
                                onChanged: (value) {
                                  emailCntrl = value;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    hintText: 'Input your email'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 53),
                              child: TextField(
                                onChanged: (value) {
                                  passCntrl = value;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Input your password',
                                    prefixIcon: Icon(Icons.lock)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(240, 10, 0, 0),
                              child: Text(
                                'Forgot password?',
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 75),
                              child: Container(
                                  width: 343,
                                  height: 57,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xff6457570D)),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      //CARA PERTAMA POST DATA TANPA STATE MANAGEMENT
                                      // var result = await postDatatoApi(
                                      //     email: emailCntrl,
                                      //     password: passCntrl);
                                      var result = await objectX.postDatatoApi(
                                        email: emailCntrl,
                                        password: passCntrl
                                      );
                                      if (result.statusCode == 200) {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Home();
                                        }));
                                      } else {
                                        AlertDialog(
                                          title: Text('Failed To Login'),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )),
                            ),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Dont Have an Acount? Sign Up'),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
