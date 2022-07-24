import 'package:flutter/material.dart';
import 'package:navigator_2_o_project/screens/thirdpage.dart';

import '../navigator/RouterDelegate.dart';

class MySecondPage extends StatefulWidget {
  const MySecondPage({Key? key}) : super(key: key);
  static const pageName = 'SecondPage';

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  dynamic text;
  @override
  Widget build(BuildContext context) {
    text = ModalRoute.of(context)!.settings.arguments;
    if (text == null) {
      text = 'Name';
    } else {
      text = text as String;
    }
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.purple,
              child: Text(text!),
            ),
          ),
          InkWell(
            onTap: () {
              MyRouterDelegate.of(context).push(const RouteSettings(
                  name: MyThirdPage.pageName, arguments: 'sajjad'));
            },
            child: const SizedBox(
              height: 100,
              width: 100,
              child: Center(child: Text('Click to ThirdPage')),
            ),
          )
        ],
      ),
    );
  }
}
