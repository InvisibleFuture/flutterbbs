import 'package:flutter/material.dart';
import 'threadlist.dart' as threadlist;

class TabDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( height: 500.0, child: MyTabbedPage(), );
  }
}

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key key}) :super(key: key);

  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[ Tab(text: 'LEFT'), Tab(text: 'Right'), ];
  TabController _tabController;

  @override
  void initState() { super.initState(); _tabController = TabController(length: myTabs.length, vsync: this); }

  @override
  void dispose() { super.dispose(); _tabController.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: TabBar( controller: _tabController, tabs: myTabs, ), ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          new threadlist.ThreadList(),
          //new forum.Forum(),
          //new thread.MyHomePage(),
          new Text("hello world !"),
          //new home.TutoriaHome(),
          //Center(child: Text('MFclajclas')),
        ],
        //children: myTabs.map((Tab tab){
        //  return Center(child: Text(tab.text),);
        //}).toList(),
      ),
    );
  }
}

class TutoriaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
      // body is 90%
      body: new Center(
        child: new Text('hello, world'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add',
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
