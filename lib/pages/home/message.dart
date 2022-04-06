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
    return Container(
      color: Colors.amber,
      child: Column(
        children: const <Widget>[
          Text('HOME>消息组件'),
          Text('HOME>消息组件'),
          //CupertinoButton(
          //  child: const Text('HELLO WORLD 2333 哈哈哈 '),
          //  color: Colors.pink,
          //  onPressed: () {
          //    //静态路由跳转，不给第二个页面传值
          //    //Navigator.pushNamed(context, 'home').then((value) {});
          //    //Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //    //  return const setting.Page(title: "goto user");
          //    //}));
          //  },
          //),
        ],
      ),
    );
  }
}
