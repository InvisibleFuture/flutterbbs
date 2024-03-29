import 'package:flutter/material.dart';
import 'package:flutterbbs/pages/thread.dart' as thread;
import 'package:flutterbbs/http.dart' as http;

class Page extends StatefulWidget {
  const Page({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  //void _gotohome() {
  //  //静态路由跳转，不给第二个页面传值
  //  Navigator.pushNamed(context, 'home').then((value) {
  //    //Fluttertoast.showToast(
  //    //  msg: value,
  //    //  toastLength: Toast.LENGTH_LONG,
  //    //  gravity: ToastGravity.BOTTOM,
  //    //);
  //  });
  //}

  final List _list = [];

  @override
  void initState() {
    super.initState();
    http.HTTP.getlist('/blog').then((value) {
      setState(() {
        _list.addAll(value);
      });
    });
  }

  void _gotothread() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const thread.Page(title: "title");
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _list.length,
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
                Text('${_list[index]['name']}', style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ), maxLines: 1 ),
                Text('${_list[index]['data']}', style: const TextStyle(
                  color: Colors.black87, fontSize: 16,
                ), maxLines: 3 ),
              ],
            ),
          ),
        );
      }),
      padding: const EdgeInsets.all(32.0),
      primary: true, //如果内容不足 它们总是可以尝试滚动
      //itemExtent: 50.0, //确定每一个item的高度 会让item加载更加高效
      //shrinkWrap: true, //内容适配
      cacheExtent: 30.0, //设置预加载的区域
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 24.0,
        );
      },
    );
  }
}
