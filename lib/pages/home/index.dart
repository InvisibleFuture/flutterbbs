import 'package:flutter/material.dart';
import 'package:flutterbbs/pages/home/threadlist.dart' as threadlist;
import 'package:flutterbbs/pages/home/market.dart' as market;
import 'package:flutterbbs/pages/home/account.dart' as account;

class Page extends StatefulWidget {
  const Page({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [
          threadlist.Page(title: 'xxx'),
          market.Page(title: 'xxx'),
          account.Page(title: 'xxx'),
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: const [
          Tab(text: "社区", icon: Icon(Icons.comment_bank)),
          Tab(text: "商城", icon: Icon(Icons.local_mall)),
          Tab(text: "我的", icon: Icon(Icons.account_box)),
        ],
        controller: tabController,
        indicatorWeight: 0.1,
        labelColor: Colors.black87,
      ),
    );
  }
}
