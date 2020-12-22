import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<String> getDailyImageUrl() async {
    http.Response res = await http.get("http://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1");
    return "http://www.bing.com/" + jsonDecode(res.body)['images'][0]['url'];
  }
}
