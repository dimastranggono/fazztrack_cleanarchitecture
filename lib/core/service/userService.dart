import 'package:dio/dio.dart';
import 'package:fazztrack_cleanarchitecture/core/model/userModel.dart';

class UserService{
  Future<userModel> getUser() async {
    var _dio = Dio();
    try {
      Response response = await _dio.get("https://jsonplaceholder.typicode.com/users");
      userModel _model = userModel.fromJson(response.data);
      return _model;
    } catch (e) {
      print("error on $e");
      throw Error();
    }
  } 
}