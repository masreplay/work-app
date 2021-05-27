import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("asdasdasd"),
      ),
      body: Container(child: Text("asd")));
}
