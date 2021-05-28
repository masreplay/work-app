import 'package:flutter/material.dart';
import 'package:work_app/constants/strings.dart';

class SingleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SingleScreenState();
}

class _SingleScreenState extends State<SingleScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: Text(item),
        ),);
  }
}
