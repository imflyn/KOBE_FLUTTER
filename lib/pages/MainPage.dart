import 'package:flutter/material.dart';
import 'package:kobe_flutter/common/ImageHelper.dart';
import 'package:kobe_flutter/generated/l10n.dart';
import 'package:kobe_flutter/net/ApiService.dart';
import 'package:package_info/package_info.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).main_page),
      ),
      drawer: _MyDrawer(),
      // bottomNavigationBar: new BottomNavigationBar(items: null),
    );
  }
}

class _MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DrawerState();
  }
}

class _DrawerState extends State<_MyDrawer> {
  String version = '';
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    _getVersion();
    _getImageUrl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _getVersion() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        version = packageInfo.version;
      });
    });
  }

  String _getImageUrl() {
    ApiService.getDailyImageUrl().then((String url) {
      setState(() {
        imageUrl = url;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.zero,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageUrl == '' ? AssetImage(ImageHelper.wrapAssets('icon_image_default.png')) : NetworkImage(imageUrl), fit: BoxFit.fill),
                  ),
                  child: Text(
                    'KOBE',
                    style: TextStyle(fontSize: 24, color: Colors.white, shadows: [Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 3)]),
                  ),
                ),
                ListTile(
                  title: Text(S.of(context).fav),
                  leading: Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                ),
              ],
            )),
            Padding(padding: EdgeInsets.only(bottom: 16), child: Text("Version: $version"))
          ],
        ),
      ),
    );
  }
}
