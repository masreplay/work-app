import 'package:flutter/cupertino.dart';

class LogoWidget extends StatelessWidget {
  final double width;
  final double height;


  LogoWidget({this.width = 300, this.height= 300});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/ic_appicon.png",
      width: 300,
      height: 300,
    );
  }
}