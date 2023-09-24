import 'package:shared_preferences/shared_preferences.dart';

Future loginSession(String username, String password) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString(username, username);
  await pref.setString(password, password);
}

Future clearSession() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return true;
}
