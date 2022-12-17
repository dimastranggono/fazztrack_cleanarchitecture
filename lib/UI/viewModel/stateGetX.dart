
import 'package:dio/dio.dart';
import 'package:fazztrack_cleanarchitecture/core/service/userService.dart';
import 'package:get/get.dart';

class stateGetX extends GetxController{
  var inputUserGetX="";
  
  var _dio = Dio();

  handleInputUser(String value){
    inputUserGetX = value;
    update();
  }

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

  UserService service;
  List setData = [];
  bool isBusy =  false;

  Future getDataUser() async{
    var response = await service.getUser();
    print("disini ${response.email}");
  }


}

