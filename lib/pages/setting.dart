import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page extends StatefulWidget {
  const Page({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Setting', style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white, //系统导航栏颜色
          systemNavigationBarDividerColor: Colors.white, //系统导航栏分隔线颜色
          statusBarColor: Colors.white, //状态栏颜色
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: const Text('bxxxxody 啊啊'),
      ),
    );
  }
}
