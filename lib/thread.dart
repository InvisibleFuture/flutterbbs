import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'data.dart' as data;
import 'user.dart' as user;

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
      if (newEntries == null && newEntries.isEmpty) {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("thread"),
      ),
      body: ListView.builder(
        // 这种方法是低效的, 应修改
        // 由于在列表顶部额外增加一个主体, item 总数 +1
        itemCount: posts.length + 1,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0){
            return Text("dwadjdaijdaijcdoijafiacfj");
          }

          // 下标需要回退1, 结束判断也要同样+1
          var _post = posts[index - 1];
          if (index == posts.length + 1) {
            return _buildProgressIndicator();
          } else {
            return ListTile(
              contentPadding: EdgeInsets.only(left: 12, right: 12),
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      _tapUser(context, _post['uid']);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network('https://bbs.xiuno.com/' + _post['user_avatar_url'], width: 36, height: 36 )
                    ),
                  ),
                ],
              ),
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

  void _tapUser(BuildContext context, String uid) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return user.Content(uid: uid);
        }
      )
    );
  }
}


