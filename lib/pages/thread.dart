import 'package:flutter/material.dart';

class Page extends StatefulWidget {
  const Page({
    Key? key,
    required this.title,
    //required this.data,
  }) : super(key: key);

  final String title;
  //final String data;

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
            backgroundColor: Colors.white,
            foregroundColor: Colors.black26,
            toolbarHeight: 80,
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(32, 120, 32, 12),
                color: Colors.white,
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      //backgroundColor: Colors.pink,
                      //child: Text('xxxx'),
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            "散仙",
                            style: TextStyle(fontSize: 24, color: Colors.black),
                          ),
                          Text(
                            "2022-03-24 00:53",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Ex",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                color: Colors.white,
                child: const Text(
                  '人与人的悲欢并不相通',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(48),
                color: Colors.white,
                child: const Text(
                  '0人关注 0人回应',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ]),
          ),
          // 回复列表
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  padding: const EdgeInsets.all(32),
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Text('$index'),
                );
              },
              childCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
