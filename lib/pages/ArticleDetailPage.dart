import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kobe_flutter/net/bean/article_list.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
      appBar: AppBar(
        title: Text(_article.title),
        actions: [IconButton(icon: Icon(Icons.star,),color: Colors.white, onPressed: () {


        })],
      ),
      body: WebView(
        initialUrl: _article.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
