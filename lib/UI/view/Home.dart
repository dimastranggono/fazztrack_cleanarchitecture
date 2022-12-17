import 'package:dio/dio.dart';
import 'package:fazztrack_cleanarchitecture/UI/viewModel/stateGetX.dart';
import 'package:fazztrack_cleanarchitecture/core/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _dio = Dio();

  Future<List> getDataFromApi() async {
    List dataSet = [];
    var result = await _dio.get("https://jsonplaceholder.typicode.com/users");
    dataSet.add(result.data);
    return dataSet[0];
    // print('disini $result');
  }

  Future postDatatoApi({String email, String password}) async {
    var result = await _dio.post("http://23.20.237.176:8000/auth/login", data: {
      "email": email,
      "password": password,
    });
    return result;
  }

  stateGetX _getXViewModel = Get.put(stateGetX());

  @override
  void initState() {
    _getXViewModel.getDataUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFCFF),
      body:Column(
          children: [
            // profile section
            Container(
              margin: EdgeInsets.fromLTRB(20, 50, 20, 41),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/Rectangle 25.png',
                      width: 52,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello , ',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Text(
                        'Robert Chandler',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 110),
                    child: InkWell(
                      onTap: () {},
                      // (() {
                      //   Navigator.push(context,MaterialPageRoute(builder: (context){
                      //     return NotificationPage();
                      //   }));
                      // }),
                      child: Image.asset(
                        'assets/bell.png',
                        width: 28,
                      ),
                    ),
                  )
                ],
              ),
            ),
            //balance section
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
              padding: EdgeInsets.all(25),
              width: 343,
              height: 141,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurpleAccent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balance',
                    style: TextStyle(fontSize: 14, color: Colors.white60),
                  ),
                  Text(
                    'Rp 120.000',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  Text(
                    '+62 81335 293 273',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70),
                  ),
                ],
              ),
            ),
            //button section
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //button1
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 162,
                    height: 57,
                    decoration: BoxDecoration(
                        color: Color(0xffEAEDFF),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/arrow-up.png'),
                        Text(
                          'Transfer',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  //button2
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 162,
                    height: 57,
                    decoration: BoxDecoration(
                        color: Color(0xffEAEDFF),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/plus.png'),
                        Text(
                          'Top Up',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
      
            // Transaction section
            Container(
              margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transaction History',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff6379F4)),
                  ),
                ],
              ),
            ),
            Container(
              width: 375,
              height: 270,
              child: GetBuilder(
                builder: (objectX) {
                  return ListView.builder(
                    itemCount: objectX.data.length,
                    itemBuilder: (context, index) {
                      return
                      Container(
                        width: 375,
                        height: 98,
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Image.asset(
                                'assets/container1.png',
                                width: 56,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    objectX.data[index]['name'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Transfer',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              'Rp 20.000',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff1EC15F),
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}
