import 'package:shared_preferences/shared_preferences.dart';

class RemoveLocalStorage{
  removeData({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove(key);
  }

  loginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("login_id");
    prefs.remove("user_name");
    prefs.remove("password");
    prefs.remove("email");
    prefs.remove("firstName");
    prefs.remove("lastName");
    prefs.remove("gender");
    prefs.remove("image");
  }

  tokenData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("accessToken");
    prefs.remove("refreshToken");
  }

}