import 'package:flutter/material.dart';
//import 'package:flutterbbs/pages/setting.dart' as setting;

class Page extends StatefulWidget {
  const Page({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 120.0,
          color: Colors.blueGrey,
        ),
        Container(
          color: Colors.amber,
          child: const Text('消息内容'),
        ),
      ],
    );
  }
}
