import 'package:flutter/material.dart';
import 'data.dart' as data;

class Content extends StatefulWidget {
  Content({Key key, this.tid, this.pages}) :super(key: key);
  final tid;
  final pages;

  @override
  _Thread createState() => _Thread();
}

class _Thread extends State<Content> {
  int i = 0;
  List posts = new List();
  bool isPerformingRequest = false;

  ScrollController _scrollController = new ScrollController();

  // 根据页面传递来的 pages 数量生成 page id
  //List pages = _sagess();
  //List pages = ['1', '2', '3', '4'];

  List<String> pages() {
    return new List<String>.generate(3, (i) => "${i+1}");
  }

  @override
  void initState() {
    super.initState();
    _getMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels + 600 >
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _getMoreData() async {
    if (!isPerformingRequest && i < pages().length) {
      setState(() => isPerformingRequest = true);
      List<Map> newEntries = await data.getPostList(widget.tid, pages()[i]);
      i++;
      print(newEntries);
      if (newEntries.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent -
            _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
            _scrollController.offset - (edge - offsetFromBottom),
            duration: new Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        }
      }
      setState(() {
        posts.addAll(newEntries);
        isPerformingRequest = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("thread MX"),
      ),
      body: ListView.builder(
          itemCount: posts.length,
          controller: _scrollController,
          itemBuilder: (context, index) {
            var _post = posts[index];
            if (index == posts.length) {
              return _buildProgressIndicator();
            } else {
              return ListTile(
                contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                title: new Text(_post['message']),
              );
            }
          }
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),),
      ),
    );
  }

}
