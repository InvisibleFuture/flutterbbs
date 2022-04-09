import 'package:flutter/material.dart';
import 'package:flutterbbs/pages/user.dart' as user;

class Page extends StatefulWidget {
  const Page({
    Key? key,
    required this.title,
    this.data = '',
    this.createdAt = '2022-03-24 00:53',
  }) : super(key: key);

  final String title;
  final String data;
  final String createdAt;
  //final String updatedAt;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  void _gotouser() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const user.Page(title: "goto user");
    }));
  }

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
                padding: const EdgeInsets.fromLTRB(32, 120, 32, 12),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: _gotouser,
                      child: const CircleAvatar(radius: 32),
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: _gotouser,
                            child: const Text(
                              "散仙",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black),
                            ),
                          ),
                          const Text(
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
              // 主要段落文字示例
              Container(
                padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      alignment: Alignment.topLeft,
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
                      height: 300,
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      decoration: const BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(48),
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
                  padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                  alignment: Alignment.center,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      const CircleAvatar(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                                child: const Text('散仙'),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(16, 10, 0, 0),
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Text('这是一条评论, 它们合并时间 $index'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              childCount: 2,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  margin: const EdgeInsets.all(32),
                  alignment: Alignment.center,
                  child: const Text('没有更多了..'),
                ),
                // 自动向下翻页
              ],
            ),
          ),
        ],
      ),
    );
  }
}
