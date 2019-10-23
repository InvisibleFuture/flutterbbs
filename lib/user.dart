import 'package:flutter/material.dart';
//import 'data.dart' as data;
//import 'package:cached_network_image/cached_network_image.dart';

class Content extends StatefulWidget {
  Content({Key key, this.uid}) :super(key: key);
  final uid;

  @override
  _User createState() => _User();
}

class _User extends State<Content> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user"),
      ),
      body: Text("data"),
    );
  }
}