import 'package:flutter/material.dart';
import 'package:flutterbbs/pages/home.dart' as home;
//import 'package:flutterbbs/pages/thread.dart' as thread;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BBS',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        }),
        primarySwatch: Colors.pink,
      ),
      routes: {
        '/home': (context) => const home.Page(title: 'Home for router'),
        '/next': (context) => const home.Page(title: 'Home for router'),
        //'start': (context) => const start.HomePage(title: "Start for router"),
        //'home': (context) => const HomePage(title: 'Home for router'),
        //'user': (context) => const HomePage(title: 'User for router'),
        //'thread': (context) => const thread.Page(title: 'thread for router'),
      },
      //home: const home.Page(title: 'Home for router'),
      initialRoute: '/home',
      debugShowMaterialGrid: false, //debug模式下显示材质网格
      checkerboardOffscreenLayers: true, //呈现到屏幕位图的层的棋盘格
      checkerboardRasterCacheImages: false, //光栅缓存图像的棋盘格
      showPerformanceOverlay: false, //顶部覆盖一层GPU和UI曲线图
    );
  }
}
