import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationPreference {
  late SharedPreferences _pref;

  Future<void> initialize() async {
    _pref = await SharedPreferences.getInstance();
  }

}
