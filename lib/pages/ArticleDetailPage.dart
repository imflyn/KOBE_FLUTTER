import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kobe_flutter/net/bean/article_list.dart';

class ArticleDetailPage extends StatefulWidget {
  final Article _article;

  ArticleDetailPage(this._article);

  @override
  State<StatefulWidget> createState() {
    return ArticleDetailState(_article);
  }
}

class ArticleDetailState extends State<ArticleDetailPage> {
  final Article _article;

  ArticleDetailState(this._article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
