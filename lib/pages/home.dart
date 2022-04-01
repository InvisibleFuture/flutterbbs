import 'package:flutter/material.dart';
import 'package:flutterbbs/pages/home/account.dart' as account;
import 'package:flutterbbs/pages/home/message.dart' as message;
import 'package:flutterbbs/pages/home/threadlist.dart' as threadlist;

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _children = <Widget>[
    const threadlist.Page(title: "233"),
    const message.Page(title: "233"),
    const account.Page(title: "233"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  actions: [],
      //  title: Text(widget.title),
      //),
      body: _children[_selectedIndex],
      //body: Center(
      //  child: Column(
      //    mainAxisAlignment: MainAxisAlignment.center,
      //    children: <Widget>[
      //      const Text('HELLO WORLD!'),
      //      Text(
      //        '$_counter',
      //        style: Theme.of(context).textTheme.headline4,
      //      ),
      //    ],
      //  ),
      //),
      //floatingActionButton: FloatingActionButton(
      //  onPressed: _incrementCounter,
      //  tooltip: 'Increment',
      //  child: const Icon(Icons.add),
      //),
      //persistentFooterButtons: const <Widget>[
      //  Text("data"),
      //  Text("data"),
      //  Text("data"),
      //],
      //drawer: Container(
      //  color: Colors.amber,
      //  child: const Text('Drawer'),
      //),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_rounded), label: 'my'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      //backgroundColor: Colors.white,
    );
  }
}
