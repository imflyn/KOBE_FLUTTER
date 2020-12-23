/// images : [{"startdate":"20201222","fullstartdate":"202012221600","enddate":"20201223","url":"/th?id=OHR.BandedPipefish_ZH-CN8209616080_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp","urlbase":"/th?id=OHR.BandedPipefish_ZH-CN8209616080","copyright":"莫阿尔博阿尔附近的带纹矛吻海龙，菲律宾 (© Jenna Szerlag/Alamy)","copyrightlink":"https://www.bing.com/search?q=%E5%B8%A6%E7%BA%B9%E7%9F%9B%E5%90%BB%E6%B5%B7%E9%BE%99&form=hpcapt&mkt=zh-cn","title":"","quiz":"/search?q=Bing+homepage+quiz&filters=WQOskey:%22HPQuiz_20201222_BandedPipefish%22&FORM=HPQUIZ","wp":true,"hsh":"5c941b9849ff540531337d70a04d1df3","drk":1,"top":1,"bot":1,"hs":[]}]
/// tooltips : {"loading":"正在加载...","previous":"上一个图像","next":"下一个图像","walle":"此图片不能下载用作壁纸。","walls":"下载今日美图。仅限用作桌面壁纸。"}
class WallPaperBean {
  List<Images> _images;
  Tooltips _tooltips;

  List<Images> get images => _images;

  Tooltips get tooltips => _tooltips;

  WallPaperBean({List<Images> images, Tooltips tooltips}) {
    _images = images;
    _tooltips = tooltips;
  }

  WallPaperBean.fromJson(dynamic json) {
    if (json["images"] != null) {
      _images = [];
      json["images"].forEach((v) {
        _images.add(Images.fromJson(v));
      });
    }
    _tooltips = json["tooltips"] != null ? Tooltips.fromJson(json["tooltips"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_images != null) {
      map["images"] = _images.map((v) => v.toJson()).toList();
    }
    if (_tooltips != null) {
      map["tooltips"] = _tooltips.toJson();
    }
    return map;
  }
}

/// loading : "正在加载..."
/// previous : "上一个图像"
/// next : "下一个图像"
/// walle : "此图片不能下载用作壁纸。"
/// walls : "下载今日美图。仅限用作桌面壁纸。"

class Tooltips {
  String _loading;
  String _previous;
  String _next;
  String _walle;
  String _walls;

  String get loading => _loading;

  String get previous => _previous;

  String get next => _next;

  String get walle => _walle;

  String get walls => _walls;

  Tooltips({String loading, String previous, String next, String walle, String walls}) {
    _loading = loading;
    _previous = previous;
    _next = next;
    _walle = walle;
    _walls = walls;
  }

  Tooltips.fromJson(dynamic json) {
    _loading = json["loading"];
    _previous = json["previous"];
    _next = json["next"];
    _walle = json["walle"];
    _walls = json["walls"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["loading"] = _loading;
    map["previous"] = _previous;
    map["next"] = _next;
    map["walle"] = _walle;
    map["walls"] = _walls;
    return map;
  }
}

/// startdate : "20201222"
/// fullstartdate : "202012221600"
/// enddate : "20201223"
/// url : "/th?id=OHR.BandedPipefish_ZH-CN8209616080_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp"
/// urlbase : "/th?id=OHR.BandedPipefish_ZH-CN8209616080"
/// copyright : "莫阿尔博阿尔附近的带纹矛吻海龙，菲律宾 (© Jenna Szerlag/Alamy)"
/// copyrightlink : "https://www.bing.com/search?q=%E5%B8%A6%E7%BA%B9%E7%9F%9B%E5%90%BB%E6%B5%B7%E9%BE%99&form=hpcapt&mkt=zh-cn"
/// title : ""
/// quiz : "/search?q=Bing+homepage+quiz&filters=WQOskey:%22HPQuiz_20201222_BandedPipefish%22&FORM=HPQUIZ"
/// wp : true
/// hsh : "5c941b9849ff540531337d70a04d1df3"
/// drk : 1
/// top : 1
/// bot : 1
/// hs : []

class Images {
  String _startdate;
  String _fullstartdate;
  String _enddate;
  String _url;
  String _urlbase;
  String _copyright;
  String _copyrightlink;
  String _title;
  String _quiz;
  bool _wp;
  String _hsh;
  int _drk;
  int _top;
  int _bot;
  List<dynamic> _hs;

  String get startdate => _startdate;

  String get fullstartdate => _fullstartdate;

  String get enddate => _enddate;

  String get url => _url;

  String get urlbase => _urlbase;

  String get copyright => _copyright;

  String get copyrightlink => _copyrightlink;

  String get title => _title;

  String get quiz => _quiz;

  bool get wp => _wp;

  String get hsh => _hsh;

  int get drk => _drk;

  int get top => _top;

  int get bot => _bot;

  List<dynamic> get hs => _hs;

  Images(
      {String startdate,
      String fullstartdate,
      String enddate,
      String url,
      String urlbase,
      String copyright,
      String copyrightlink,
      String title,
      String quiz,
      bool wp,
      String hsh,
      int drk,
      int top,
      int bot,
      List<dynamic> hs}) {
    _startdate = startdate;
    _fullstartdate = fullstartdate;
    _enddate = enddate;
    _url = url;
    _urlbase = urlbase;
    _copyright = copyright;
    _copyrightlink = copyrightlink;
    _title = title;
    _quiz = quiz;
    _wp = wp;
    _hsh = hsh;
    _drk = drk;
    _top = top;
    _bot = bot;
    _hs = hs;
  }

  Images.fromJson(dynamic json) {
    _startdate = json["startdate"];
    _fullstartdate = json["fullstartdate"];
    _enddate = json["enddate"];
    _url = json["url"];
    _urlbase = json["urlbase"];
    _copyright = json["copyright"];
    _copyrightlink = json["copyrightlink"];
    _title = json["title"];
    _quiz = json["quiz"];
    _wp = json["wp"];
    _hsh = json["hsh"];
    _drk = json["drk"];
    _top = json["top"];
    _bot = json["bot"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["startdate"] = _startdate;
    map["fullstartdate"] = _fullstartdate;
    map["enddate"] = _enddate;
    map["url"] = _url;
    map["urlbase"] = _urlbase;
    map["copyright"] = _copyright;
    map["copyrightlink"] = _copyrightlink;
    map["title"] = _title;
    map["quiz"] = _quiz;
    map["wp"] = _wp;
    map["hsh"] = _hsh;
    map["drk"] = _drk;
    map["top"] = _top;
    map["bot"] = _bot;
    if (_hs != null) {
      map["hs"] = _hs.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
