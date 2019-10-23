import 'package:flutter/material.dart';
import 'data.dart' as data;
import 'user.dart' as user;
import 'thread.dart' as thread;

class ThreadList extends StatefulWidget {
  @override
  _ThreadList createState() => _ThreadList();
}

class _ThreadList extends State<ThreadList> {
  List<String> page = ['1', '2', '3', '4', '5', '6']; //get 多少页
  var i = 0;

  List<Map> items = [];
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;

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
    if (!isPerformingRequest && i < page.length) {
      setState(() => isPerformingRequest = true);
      List<Map> newEntries = await data.getThreadList(page[i]);
      i++;
      // print(newEntries);
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
        items.addAll(newEntries);
        isPerformingRequest = false;
      });
    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //appBar: AppBar(
      //  title: Text("Infinite ListView"),
      //),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          var _data = items[index];
          if (index == items.length) {
            return _buildProgressIndicator();
          } else {
            return ListTile(
              contentPadding: EdgeInsets.only(left: 12, right: 12),
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      _tapUser(context, _data['uid']);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network('https://bbs.xiuno.com/' + _data['user_avatar_url'], width: 36, height: 36 )
                    ),
                  ),
                ],
              ),
              title: new Text(_data['subject']),
              subtitle: Row(
                children: <Widget>[
                  new Expanded (
                    child: new Row(
                      children: <Widget>[
                        Text(_data['username'],),
                        Text(_data['last_date_fmt'], textAlign: TextAlign.left,)
                      ],
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Icon(
                          Icons.chat_bubble_outline, color: Colors.green,
                          size: 14,),
                      ),
                      Text(_data['posts'], textAlign: TextAlign.right,),
                    ],
                  ),
                ],
              ),
              onTap: () {
                _navigateSecondPage(context, _data['tid'], _data['pages']);
              },
            );
          }
        },
        controller: _scrollController,
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

  void _navigateSecondPage(BuildContext context, String tid, int pages) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) {
              return thread.Content(tid: tid, pages: pages);
            }
        )
    );
  }
}
