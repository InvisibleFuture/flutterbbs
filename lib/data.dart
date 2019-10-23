import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

// 未知
Future<List<Map>> threadRequest(String id, String page) async {
  var client = new HttpClient();
  var uri = new Uri.http(
      'bbs.xiuno.com', '/thread-$id-$page.htm', {'ajax': 'true'});
  return client.getUrl(uri).then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) async {
    var json = await response.transform(utf8.decoder).join();
    var data = jsonDecode(json);

    // json Object -> json Array 此处应为数组,而不是对象, 临时作转换
    List<Map> list = [];
    if (data['code'] == "0") {
      data['message'].forEach((k, v) => list.add(v));
    }else{
      print('error');
    }

    return list;
  }).catchError((onError) {
    print(onError.toString());
  });
}


/* Get Threads
 * return [{id:1, name:'ss'}]
 * return []
**/
Future<List<Map>> getThreadList(String id) async {
  List<Map> list = [];
  var client = new HttpClient();
  var uri = new Uri.http('bbs.xiuno.com', '/index-$id.htm', {'ajax': 'true'});

  return client.getUrl(uri)
  .then((HttpClientRequest request){ return request.close(); })
  .then((HttpClientResponse response) async {
    var json = await response.transform(utf8.decoder).join();
    var data = jsonDecode(json);

    // json Object -> json Array 此处应为数组,而不是对象, 临时作转换
    if (data['code'] == "0") {
      data['message'].forEach((k, v) => list.add(v));
    }else{
      print("error code");
    }
    return list;
  }).catchError((onError) {
    print(onError.toString());
    return list;
  });
}


/* Get Posts
 * return [{id:1, name:'ss'}]
 * return []
**/
Future<List<Map>> getPostList(String id, String p) async {
  List<Map> list = [];
  var client = new HttpClient();
  var uri = new Uri.http('bbs.xiuno.com', '/thread-$id-$p.htm', {'ajax': 'true'});
  
  return client.getUrl(uri).then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) async {
    // 取得了数据
    // json Object -> json Array 此处应为数组,而不是对象, 临时作转换
    var json = await response.transform(utf8.decoder).join();
    var data = jsonDecode(json);
    // 输出不标准, 多判断一次对象是否存在
    if (data['code'] == "0" && data['message']['postlist'] != null && data['message']['postlist'].length > 0) {
      print(data['message']['postlist']);
      data['message']['postlist'].forEach((k, v) => list.add(v));
    }
    print('error');
    return list;
  }).catchError((onError) {
    print(onError.toString());
    return list;
  });
}



// 理论上全局只使用一个
class Data {
  // 一般不必缓存的
  Map users = {};
  Map threads = {};
  Map posts = {};
  Map replys = {};

  // 必要缓存的
  Map settings = {};
}

// 每个对象都使用一个
class Threads {}
class Posts {}
class File {
  String id;
  String name;
  String type;
  String hash;
  int size;
  int time;
}
class User {
  String id;
  String name;
  var avatar = FadeInImage.assetNetwork(
    image: 'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
    placeholder: 'images/birds.gif' /* 指定gif */,
  );
  String group;
  String status;
}
