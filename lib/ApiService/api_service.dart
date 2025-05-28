import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webledger_interview/Model/login_model.dart';
import 'package:webledger_interview/Model/recipes_model.dart';
import 'package:webledger_interview/Utils/LocalStorage/set_storage.dart';

class ApiService{
  static const String baseUrl = "https://dummyjson.com/";
  static const String acceptString = "application/json";
  static const String contentTypeString = "application/json";
  static const String cookieString = "accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwidXNlcm5hbWUiOiJtaWNoYWVsdyIsImVtYWlsIjoibWljaGFlbC53aWxsaWFtc0B4LmR1bW15anNvbi5jb20iLCJmaXJzdE5hbWUiOiJNaWNoYWVsIiwibGFzdE5hbWUiOiJXaWxsaWFtcyIsImdlbmRlciI6Im1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL21pY2hhZWx3LzEyOCIsImlhdCI6MTc0ODQyMzg1NiwiZXhwIjoxNzQ4NDI3NDU2fQ.GY94B5cOJG9v5hGbzRG_F1OEAG6WFHIN4WxA1_zPuzQ; refreshToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwidXNlcm5hbWUiOiJtaWNoYWVsdyIsImVtYWlsIjoibWljaGFlbC53aWxsaWFtc0B4LmR1bW15anNvbi5jb20iLCJmaXJzdE5hbWUiOiJNaWNoYWVsIiwibGFzdE5hbWUiOiJXaWxsaWFtcyIsImdlbmRlciI6Im1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL21pY2hhZWx3LzEyOCIsImlhdCI6MTc0ODQyMzg1NiwiZXhwIjoxNzUxMDE1ODU2fQ.ud4pv5fajauuYKVkzCAkeM4EpWXKlFny95z88EUP9jE";

  /// ----- EndPoint ----- ///
  static const String loginEndPoint = "auth/login";
  static const String recipesEndPoint = "recipes";

  Future<Map<String,dynamic>> postLoginApi({required String userName, required String password}) async {
    var headers = {
      'Accept': acceptString,
      'Content-Type': contentTypeString,
      'Cookie': cookieString
    };
    Uri url = Uri.parse("$baseUrl$loginEndPoint");
    var request = http.Request('POST', url);
    request.body = json.encode({
      "username": userName,
      "password": password
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final responseBody = await response.stream.bytesToString();
    final jsonResponse = jsonDecode(responseBody);
    if (response.statusCode == 200) {

      LoginModel loginModel = LoginModel.fromJson(jsonResponse);

      SetLocalStorage().loginData(
          loginId: loginModel.id ?? 0,
          userName: loginModel.username ?? '',
          password: password,
          email: loginModel.email ?? '',
          firstName: loginModel.firstName ?? '',
          lastName: loginModel.lastName ?? '',
          gender: loginModel.gender ?? '',
          image: loginModel.image ?? '',
      );

      SetLocalStorage().tokenData(
          accessToken: loginModel.accessToken ?? '',
          refreshToken: loginModel.refreshToken ?? ''
      );

      Map<String,dynamic> map ={
        "error": false,
        "msg": "User Login Successfully",
      };
      return map;
    }
    else {
      Map<String,dynamic> map ={
        "error": true,
        "msg": jsonResponse['message'],
      };
      return map;
    }
  }

  Future<Map<String,dynamic>> getRecipesApi() async {
    Uri url = Uri.parse("$baseUrl$recipesEndPoint");
    var request = http.Request('GET', url);
    http.StreamedResponse response = await request.send();

    final responseBody = await response.stream.bytesToString();
    final jsonResponse = jsonDecode(responseBody);

    if (response.statusCode == 200) {

      RecipesModel recipesModel = RecipesModel.fromJson(jsonResponse);

      Map<String,dynamic> map ={
        "error": false,
        "data": recipesModel,
      };

      return map;
    }
    else {
      Map<String,dynamic> map ={
        "error": true,
        "msg": jsonResponse['message'],
      };
      return map;
    }
  }
}