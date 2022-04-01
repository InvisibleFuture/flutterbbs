import 'package:flutter/material.dart';
import 'package:flutterbbs/pages/user.dart' as user;
import 'package:flutterbbs/pages/setting.dart' as setting;

class Page extends StatefulWidget {
  const Page({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  void _gotouser() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const user.Page(title: "goto user");
    }));
  }

  void _gotosetting() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const setting.Page(title: "goto user");
    }));
  }

  @override
  Widget build(BuildContext context) {
    //return Container(
    //  color: Colors.white,
    //  child: const Text('先检查是否登录状态, 未登录的显示为登录页'),
    //);
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //const SliverAppBar(
          //  automaticallyImplyLeading: true,
          //  backgroundColor: Colors.white,
          //  foregroundColor: Colors.black26,
          //  toolbarHeight: 80,
          //),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // 框架在最下层
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 440,
                      ),
                      Container(
                        color: Colors.pink,
                        height: 380,
                      ),
                      InkWell(
                        onTap: _gotosetting,
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.settings_suggest,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // 用户头像在上层
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                        ),
                      ),
                      const CircleAvatar(radius: 55)
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: Text("散仙", style: TextStyle(fontSize: 32)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text("中国 * 2条目", style: TextStyle(fontSize: 16)),
              ),
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
            ]),
          ),
        ],
      ),
    );
  }
}
