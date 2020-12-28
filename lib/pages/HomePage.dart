import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:kobe_flutter/common/ImageHelper.dart';
import 'package:kobe_flutter/net/ApiService.dart';
import 'package:kobe_flutter/net/bean/banner_image_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List _bannerDataList = List<BannerImageData>();

  @override
  void initState() {
    super.initState();
    _getImageList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getImageList() {
    ApiService.getBannerImageList().then((BannerImageList bean) {
      if (null != bean && bean.data != null) {
        List list = List<BannerImageData>();
        bean.data.forEach((element) {
          list.add(element);
        });
        setState(() {
          _bannerDataList = list;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
          child: _bannerDataList.isEmpty
              ? Image.asset(ImageHelper.wrapAssets("icon_image_default.png"))
              : Swiper(
                  autoplayDisableOnInteraction: true,
                  autoplayDelay: 8000,
                  duration: 500,
                  loop: true,
                  outer: false,
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInImage(
                        image: NetworkImage(_bannerDataList[index].image),
                        placeholder: AssetImage(ImageHelper.wrapAssets("icon_image_default.png")),
                        fit: BoxFit.cover);
                  },
                  pagination: SwiperPagination(
                      margin: new EdgeInsets.all(5.0),
                      builder: DotSwiperPaginationBuilder(size: 5, activeSize: 6, activeColor: Colors.black, color: Colors.black12)),
                  itemCount: _bannerDataList.length,
                ),
          constraints: BoxConstraints.loose(new Size(MediaQuery.of(context).size.width, 225.0))),
    );
  }
}
