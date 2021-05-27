import 'dart:async';

import 'package:work_app/constants/assets.dart';
import 'package:work_app/data/sharedpref/constants/preferences.dart';
import 'package:work_app/utils/routes/routes.dart';
import 'package:work_app/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 25,178,238),
                  Color.fromARGB(255, 21,236,229)
                ],
              )),
          child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "images/app_logo.png",
                width: 128,
                height: 128,
              )),
        ),
      );
  }

}
