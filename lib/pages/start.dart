import 'package:flutter/material.dart';
import 'package:flutterbbs/pages/thread.dart' as thread;

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _gotohome() {
    //静态路由跳转，不给第二个页面传值
    Navigator.pushNamed(context, 'home').then((value) {
      //Fluttertoast.showToast(
      //  msg: value,
      //  toastLength: Toast.LENGTH_LONG,
      //  gravity: ToastGravity.BOTTOM,
      //);
    });
  }

  void _gotothread() {
    //动态路由跳转，自己创建第二个页面并传值
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const thread.Page(title: "title");
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: 32,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: _gotothread,
            borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            child: Container(
              height: 150,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1.0, 1.0), //阴影偏移
                    blurRadius: 10, //阴影模糊
                    spreadRadius: -10.0, //阴影扩散
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '发布你的第一条动态 $index',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    '动态发布后, 会自动推送到社区讨论~',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    '被回复会收到通知~',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        padding: const EdgeInsets.all(32.0),
        //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
        primary: true,
        //确定每一个item的高度 会让item加载更加高效
        //itemExtent: 50.0,
        //内容适配
        //shrinkWrap: true,
        //设置预加载的区域
        cacheExtent: 30.0,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 24.0,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      //child: Column(
      //  mainAxisAlignment: MainAxisAlignment.center,
      //  children: <Widget>[
      //    const Text('Start Wooooooooooo!'),
      //    Text(
      //      '$_counter',
      //      style: Theme.of(context).textTheme.headline4,
      //    ),
      //    ElevatedButton(
      //      child: const Text('点我点我'),
      //      onPressed: _gotohome,
      //    ),
      //  ],
      //),
    );
  }
}
