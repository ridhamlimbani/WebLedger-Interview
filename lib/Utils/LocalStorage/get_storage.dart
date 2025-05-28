import 'package:shared_preferences/shared_preferences.dart';
import 'package:webledger_interview/Const/app_string.dart';

class GetLocalStorage{
  Future<String?> getData({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  getLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userNameString =  prefs.getString("user_name") ?? "";
    int loginIdString = prefs.getInt("login_id") ?? 0;
    String passwordString =  prefs.getString("password") ?? "";
    String emailString =  prefs.getString("email") ?? "";
    String firstNameString =  prefs.getString("firstName") ?? "";
    String lastNameString =  prefs.getString("lastName") ?? "";
    String genderString =  prefs.getString("gender") ?? "";
    String imageString =  prefs.getString("image") ?? "";

    userName.value = userNameString;
    loginId.value= loginIdString;
    password.value = passwordString;
    email.value = emailString;
    firstName.value = firstNameString;
    lastName.value = lastNameString;
    gender.value = genderString;
    image.value = imageString;
  }

   getTokenData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessTokenString =  prefs.getString("accessToken") ?? "";
    String refreshTokenString =  prefs.getString("refreshToken") ?? "";

    accessToken.value = accessTokenString;
    refreshToken.value = refreshTokenString;
  }
}