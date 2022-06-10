import 'package:flutter/material.dart';
import 'package:flutterbbs/pages/user.dart' as user;
import 'package:flutterbbs/pages/setting.dart' as setting;
import 'package:flutterbbs/pages/shoppingcart.dart' as shoppingcart;
import 'package:extended_image/extended_image.dart';

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

  //return Container(
  //  color: Colors.white,
  //  child: const Text('先检查是否登录状态, 未登录的显示为登录页'),
  //);
  bool _showSwiper = false;

  @override
  Widget build(BuildContext context) {
    return ExtendedImageSlidePage(
      slideAxis: SlideAxis.both,
      slideType: SlideType.onlyImage,
      onSlidingPage: (state) {
        var showSwiper = !state.isSliding;
        if (showSwiper != _showSwiper) {
          _showSwiper = showSwiper;
          //rebuildSwiper.add(_showSwiper);
        }
      },
      child: Material(
        child: CustomScrollView(
          slivers: <Widget>[
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
                            padding: EdgeInsets.only(right: 20, top: 40),
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
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              Image.asset('static/images/avatar.jpeg').image,
                        ),
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
                /// 我的订单列表
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 40.0, bottom: 40.0),
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
                  child: Flex(
                    mainAxisAlignment: MainAxisAlignment.center,
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return const shoppingcart.Page(title: "shopping cart");
                            }));
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [Icon(Icons.local_grocery_store), Text('购物车')],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [Icon(Icons.payment), Text('待付款')],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [Icon(Icons.gif_box), Text('待发货')],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [Icon(Icons.local_shipping), Text('待收货')],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [Icon(Icons.home_repair_service), Text('退款/售后')],
                        ),
                      ),
                    ],
                  ),
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
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black),
                              ),
                            ),
                            const Text(
                              "2022-03-24 00:53",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
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
      ),
    );
  }
}
