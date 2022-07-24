import 'package:flutter/material.dart';
import 'package:navigator_2_o_project/navigator/RouterDelegate.dart';
import 'package:navigator_2_o_project/screens/secondpage.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);
  static const pageName = '/';

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.amber,
            ),
          ),
          InkWell(
            onTap: () {
              MyRouterDelegate.of(context).push(const RouteSettings(
                  name: MySecondPage.pageName, arguments: 'Hello World'));
            },
            child: Container(
                height: 100,
                width: 100,
                child: const Center(child: Text('Click to SecondPage'))),
          )
        ],
      ),
    );
  }
}
