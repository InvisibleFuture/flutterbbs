import 'package:flutter/material.dart';
import 'package:flutterbbs/pages/home.dart';
import 'package:flutterbbs/pages/home.dart' show HomePage;
import 'package:flutterbbs/pages/start.dart' as start;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page 中文X'),
      routes: {
        'start': (context) => const start.HomePage(title: "Start for router"),
        'home': (context) => const HomePage(title: 'Home for router'),
        'user': (context) => const HomePage(title: 'User for router'),
        'thread': (context) => const HomePage(title: 'thread for router'),
      },
      //initialRoute: 'start',
      //debugShowMaterialGrid: false, //debug模式下显示材质网格
      //checkerboardOffscreenLayers: true, //呈现到屏幕位图的层的棋盘格
      //checkerboardRasterCacheImages: true, //光栅缓存图像的棋盘格
      //showPerformanceOverlay: false, //顶部覆盖一层GPU和UI曲线图
    );
  }
}
