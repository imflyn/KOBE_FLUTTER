import 'dart:convert';

import 'package:http/http.dart' as http;

import 'bean/wall_paper_bean.dart';

class ApiService {
  static Future<String> getDailyImageUrl() async {
    print("getDailyImageUrl start");
    http.Response res = await http.get("http://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1");
    return "http://www.bing.com/" + WallPaperBean.fromJson(jsonDecode(res.body)).images[0].url;
  }
}
