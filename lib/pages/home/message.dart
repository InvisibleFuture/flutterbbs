import 'package:flutter/material.dart';

class Page extends StatefulWidget {
  const Page({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Text('message, 消息中心未登录默认是没有消息的, 也许可以有系统消息'),
    );
  }
}
