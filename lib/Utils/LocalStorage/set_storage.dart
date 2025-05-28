import 'package:shared_preferences/shared_preferences.dart';

class SetLocalStorage{
  setData({required String key, required String value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
  }

  loginData({required int loginId,required String userName, required String password,required String email, required String firstName, required String lastName, required String gender, required String image}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("login_id", loginId);
    prefs.setString("user_name", userName);
    prefs.setString("password", password);
    prefs.setString("email", email);
    prefs.setString("firstName", firstName);
    prefs.setString("lastName", lastName);
    prefs.setString("gender", gender);
    prefs.setString("image", image);
  }

  tokenData({required String accessToken, required String refreshToken}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("accessToken", accessToken);
    prefs.setString("refreshToken", refreshToken);
  }

}