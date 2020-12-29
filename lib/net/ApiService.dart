import 'dart:convert';

import 'package:http/http.dart' as http;

import 'bean/banner_image_list.dart';
import 'bean/categories.dart';
import 'bean/wall_paper_bean.dart';

class ApiService {
  static Future<String> getDailyImageUrl() async {
    print("getDailyImageUrl start");
    http.Response res = await http.get("http://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1");
    return "http://www.bing.com/" + WallPaperBean.fromJson(jsonDecode(res.body)).images[0].url;
  }

  static Future<BannerImageList> getBannerImageList() async {
    print("getBannerImageList start");
    http.Response res = await http.get("https://gank.io/api/v2/banners");
    return BannerImageList.fromJson(jsonDecode(res.body));
  }

  static Future<Categories> getCategories() async {
    print("getCategories start");
    http.Response res = await http.get("https://gank.io/api/v2/categories/GanHuo");
    return Categories.fromJson(jsonDecode(res.body));
  }
}
