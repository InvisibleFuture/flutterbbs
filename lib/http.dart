import 'dart:io';
import 'dart:convert';

var client = HttpClient();
var host = 'https://satori.love/api';
var port = 443;

class HTTP {
  static Future<List> getlist(String path) async {
    var request = await client.getUrl(Uri.parse(host + path));
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();

    const json = JsonCodec();
    List data = json.decode(responseBody);
    return data;
  }

  static Future<HttpClientResponse> post(String path) async {
    var request = await client.get(host, port, path);
    var response = await request.close();
    return response;
  }

  static Future<HttpClientResponse> patch(String path) async {
    var request = await client.get(host, port, path);
    var response = await request.close();

    switch (response.statusCode) {
      case 200:
      case 400:
    }

    return response;
  }

  static Future<HttpClientResponse> delete(String path) async {
    var request = await client.get(host, port, path);
    var response = await request.close();
    return response;
  }

  // 处理不同响应结果

}
