import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_app/models/login/login_response.dart';

import 'constants/preferences.dart';

@Singleton()
class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------
  Future<String?> get authToken async {
    return _sharedPreference.getString(Preferences.auth_token);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreference.setString(Preferences.auth_token, authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(Preferences.auth_token);
  }



  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference.getBool(Preferences.is_logged_in) ?? false;
  }
  Future<Future<bool>> removeUser() async {
    return _sharedPreference.remove(Preferences.user);
  }


  Future<Future<bool>> removeIsLoggedIn() async {
    return _sharedPreference.remove(Preferences.is_logged_in);
  }

  Future<bool> saveIsLoggedIn(bool value) async {
    return _sharedPreference.setBool(Preferences.is_logged_in, value);
  }

  Future<UserData?> get user async {

    /// jsonString
    var userString = _sharedPreference.getString(Preferences.user);

    debugPrint("sheared preference get");
    debugPrint(userString);

    if (userString != null) {
      /// string -> json -> map
      Map<String, dynamic> userMap = jsonDecode(userString);
      return UserData.fromJson(userMap);
    }
  }

  Future<bool> saveUser(UserData value) async {
    debugPrint("sheared preference set");
    /// map
    var user = value.toJson();
    /// json -> string
    var encode = json.encode(user);
    debugPrint(encode);
    /// save
    return _sharedPreference.setString(Preferences.user,encode );
  }




  // Theme:------------------------------------------------------
  bool get isDarkMode {
    return _sharedPreference.getBool(Preferences.is_dark_mode) ?? false;
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _sharedPreference.setBool(Preferences.is_dark_mode, value);
  }

  // Language:---------------------------------------------------
  String? get currentLanguage {
    return _sharedPreference.getString(Preferences.current_language);
  }

  Future<void> changeLanguage(String language) {
    return _sharedPreference.setString(Preferences.current_language, language);
  }
}