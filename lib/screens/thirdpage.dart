import 'package:flutter/material.dart';

class MyThirdPage extends StatefulWidget {
  const MyThirdPage({Key? key}) : super(key: key);
  static const pageName = 'ThirdPage';
  @override
  State<MyThirdPage> createState() => _MyThirdPageState();
}

class _MyThirdPageState extends State<MyThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.amber,
        ),
      ),
    );
  }
}
