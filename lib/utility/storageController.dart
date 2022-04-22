//name, age

import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? storage;
getStorage() async {
  storage = await SharedPreferences.getInstance();
}
