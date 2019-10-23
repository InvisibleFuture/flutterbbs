import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart' as home;

/*
* 避免服务器作任何渲染运算
* */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final SystemUiOverlayStyle _style = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(_style);
    return new MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter BBS',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        //pageTransitionsTheme: ,
        primarySwatch: Colors.blue,
        //primaryColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      home: new home.TabDemo(),
    );
  }
}
