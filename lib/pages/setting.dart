import 'package:flutter/material.dart';
import 'package:flutterbbs/pages/setting/about.dart' as about;
import 'package:flutterbbs/pages/setting/version.dart' as version;
//import 'package:flutter/services.dart';

class Page extends StatefulWidget {
  const Page({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Setting', style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white12,
        iconTheme: const IconThemeData(color: Colors.black),
        //systemOverlayStyle: const SystemUiOverlayStyle(
        //  systemNavigationBarColor: Colors.white, //系统导航栏颜色
        //  systemNavigationBarDividerColor: Colors.white, //系统导航栏分隔线颜色
        //  statusBarColor: Colors.white, //状态栏颜色
        //),
      ),
      body: ListView(
        children: [
          ListTile(
            trailing: const Icon(Icons.chevron_right),
            leading: const Icon(Icons.account_circle),
            title: const Text('账号与安全'),
            onTap: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //  return const about.Page();
              //}));
            },
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right),
            leading: const Icon(Icons.redeem),
            title: const Text('关于我们'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const about.Page();
              }));
            },
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right),
            leading: const Icon(Icons.assignment),
            title: const Text('用户协议'),
            onTap: () {},
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right),
            leading: const Icon(Icons.verified),
            title: const Text('版本信息'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const version.Page();
              }));
            },
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: TextButton(
              onPressed: () {},
              child: const Text('退出登录'),
            ),
          ),
        ],
      ),
      //body: ListView.builder(
      //  itemCount: 3,
      //  itemBuilder: (BuildContext context, int index) {
      //    return Container(
      //      color: Colors.amber,
      //      child: const Text('bxxxxody 啊啊'),
      //    );
      //  }
      //)
    );
  }
}
