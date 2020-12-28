/// data : [{"image":"http://gank.io/images/cfb4028bfead41e8b6e34057364969d1","title":"干货集中营新版更新","url":"https://gank.io/migrate_progress"},{"image":"http://gank.io/images/aebca647b3054757afd0e54d83e0628e","title":"- 春水初生，春林初盛，春风十里，不如你。","url":"https://gank.io/post/5e51497b6e7524f833c3f7a8"},{"image":"https://pic.downk.cc/item/5e7b64fd504f4bcb040fae8f.jpg","title":"盘点国内那些免费好用的图床","url":"https://gank.io/post/5e7b5a8b6d2e518fdeab27aa"}]
/// status : 100

class BannerImageList {
  List<BannerImageData> _data;
  int _status;

  List<BannerImageData> get data => _data;

  int get status => _status;

  BannerImageList({List<BannerImageData> data, int status}) {
    _data = data;
    _status = status;
  }

  BannerImageList.fromJson(dynamic json) {
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(BannerImageData.fromJson(v));
      });
    }
    _status = json["status"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    map["status"] = _status;
    return map;
  }
}

/// image : "http://gank.io/images/cfb4028bfead41e8b6e34057364969d1"
/// title : "干货集中营新版更新"
/// url : "https://gank.io/migrate_progress"

class BannerImageData {
  String image;
  String title;
  String url;

  BannerImageData({String image, String title, String url}) {
    this.image = image;
    this.title = title;
    this.url = url;
  }

  BannerImageData.fromJson(dynamic json) {
    this.image = json["image"];
    this.title = json["title"];
    this.url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["image"] = this.image;
    map["title"] = this.title;
    map["url"] = this.url;
    return map;
  }
}
