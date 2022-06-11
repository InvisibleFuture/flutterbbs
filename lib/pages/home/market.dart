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
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white12,
            foregroundColor: Colors.black26,
            toolbarHeight: 80,
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                padding: const EdgeInsets.all(20.0),
                child: const Text('23333'),
              ),
            ]),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width/2, // 子控件最大宽度
              childAspectRatio: 0.75,                                  // 子控件宽高比例
              crossAxisSpacing: 0,                                     // 交叉轴间距
              mainAxisSpacing: 0,                                      // 主轴间距
            ),
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                height: 80,
                margin: const EdgeInsets.all(8.0),
                color: Colors.redAccent,
              );
            }),
          ),
        ],
      ),
    );
  }
}
