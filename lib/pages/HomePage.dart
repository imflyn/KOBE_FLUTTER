import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:kobe_flutter/common/GlobalConfig.dart';
import 'package:kobe_flutter/common/ImageHelper.dart';
import 'package:kobe_flutter/generated/l10n.dart';
import 'package:kobe_flutter/net/ApiService.dart';
import 'package:kobe_flutter/net/bean/banner_image_list.dart';
import 'package:kobe_flutter/net/bean/categories.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<BannerImageData> _bannerDataList = List<BannerImageData>();
  List<Categorie> categorieList = List<Categorie>();

  @override
  void initState() {
    super.initState();
    _getImageList();
    _getCategories();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getImageList() {
    ApiService.getBannerImageList().then((BannerImageList bean) {
      if (null != bean && bean.data != null) {
        setState(() {
          _bannerDataList = bean.data;
        });
      }
    });
  }

  _getCategories() {
    ApiService.getCategories().then((Categories bean) {
      if (null != bean && bean.data != null) {
        setState(() {
          categorieList = bean.data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double top = 0.0;
    return categorieList.length == 0
        ? Container()
        : DefaultTabController(
            length: categorieList.length,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                      toolbarHeight: 48,
                      backgroundColor: GlobalConfig.colorPrimaryDark,
                      elevation: 3,
                      forceElevated: top == 120,
                      leading: IconButton(
                        icon: Icon(
                          Icons.menu,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      title: top != 120 ? Text("") : Text(S.of(context).main_page, style: TextStyle(fontSize: 18)),
                      centerTitle: false,
                      pinned: true,
                      floating: false,
                      snap: false,
                      primary: true,
                      expandedHeight: 250.0,
                      flexibleSpace: LayoutBuilder(
                        builder: (context, constraints) {
                          top = constraints.biggest.height;
                          return FlexibleSpaceBar(
                            collapseMode: CollapseMode.parallax,
                            background: Padding(
                              padding: EdgeInsets.only(bottom: 48),
                              child: Container(
                                child: _bannerDataList.isEmpty
                                    ? Image.asset(
                                        ImageHelper.wrapAssets("icon_image_default.png"),
                                        fit: BoxFit.fill,
                                        width: MediaQuery.of(context).size.width,
                                      )
                                    : Swiper(
                                        autoplayDisableOnInteraction: true,
                                        autoplayDelay: 8000,
                                        duration: 500,
                                        loop: true,
                                        outer: false,
                                        autoplay: true,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Stack(
                                            alignment: Alignment.bottomLeft,
                                            children: [
                                              FadeInImage(
                                                  width: MediaQuery.of(context).size.width,
                                                  image: NetworkImage(_bannerDataList[index].image),
                                                  placeholder: AssetImage(ImageHelper.wrapAssets("icon_image_default.png")),
                                                  fit: BoxFit.cover),
                                              Container(
                                                width: MediaQuery.of(context).size.width,
                                                height: 46,
                                                color: Colors.black.withAlpha(66),
                                                child: Padding(
                                                  padding: EdgeInsets.only(left: 8, top: 8, right: 8),
                                                  child: Text(
                                                    _bannerDataList[index].title,
                                                    style: TextStyle(color: Colors.white, fontSize: 14),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                        pagination: SwiperPagination(
                                            margin: new EdgeInsets.all(5.0),
                                            builder: DotSwiperPaginationBuilder(size: 5, activeSize: 6, activeColor: Colors.black, color: Colors.grey)),
                                        itemCount: _bannerDataList.length,
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(48),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          color: GlobalConfig.colorPrimary,
                          child: TabBar(
                            isScrollable: true,
                            indicatorColor: GlobalConfig.colorAccent,
                            tabs: categorieList
                                .map((Categorie categorie) => Tab(
                                      child: Text(
                                        categorie.title,
                                        style: TextStyle(color: Colors.white, fontSize: 14),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      )),
                ];
              },
              body: TabBarView(
                children: categorieList.map((Categorie categorie) => RefreshListView()).toList(),
              ),
            ));
  }
}

class RefreshListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RefreshListViewState();
  }
}

class _RefreshListViewState extends State<RefreshListView> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8", "1", "2", "3", "4", "5", "6", "7", "8", "1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController = RefreshController(initialRefresh: true);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 250));
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: MaterialClassicHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("Release to Load more");
          } else {
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
        itemExtent: 100.0,
        itemCount: items.length,
      ),
    );
  }

  // don't forget to dispose refreshController
  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
