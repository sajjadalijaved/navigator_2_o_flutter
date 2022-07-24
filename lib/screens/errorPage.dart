import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key}) : super(key: key);
  static const pageName = 'ErrorPage';

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.red,
      child: const Text(
        '404 Page Not Found',
        style: TextStyle(color: Colors.white),
      ),
    ));
  }
}
