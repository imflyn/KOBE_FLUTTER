import 'package:flutter/material.dart';
import 'package:kobe_flutter/common/GlobalConfig.dart';
import 'package:kobe_flutter/generated/l10n.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
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
    return MaterialApp(
        theme: new ThemeData(primaryColor: GlobalConfig.colorPrimary),
        home: Scaffold(
          appBar: new AppBar(
            title: new Text(S.of(context).main_page),
          ),
          drawer: new Drawer(),
          // bottomNavigationBar: new BottomNavigationBar(items: null),
        ));
  }
}
