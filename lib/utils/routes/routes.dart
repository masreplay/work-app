import 'package:work_app/ui/home/home.dart';
import 'package:work_app/ui/single/single.dart';
import 'package:work_app/ui/login/login.dart';
import 'package:work_app/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String singleItem = '/single_item';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    singleItem: (BuildContext context) => SingleScreen(),
  };
}



