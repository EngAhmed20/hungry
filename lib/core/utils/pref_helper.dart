import 'package:hungry/core/constants/app_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
final SharedPreferences prefs;
  PrefHelper(this.prefs);
  Future<void> saveToken(String token) async {
    await prefs.setString(tokenKey, token);
  }
  String? getToken() {
    return prefs.getString(tokenKey);
  }
  Future<void> clearToken() async {
    await prefs.remove(tokenKey);
  }


}