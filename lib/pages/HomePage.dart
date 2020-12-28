import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
          child: Swiper(
            autoplayDisableOnInteraction: true,
            autoplayDelay: 8000,
            duration: 500,
            loop: true,
            outer: false,
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=360910958,2971105829&fm=26&gp=0.jpg",
                fit: BoxFit.fill,
              );
            },
            pagination: SwiperPagination(margin: new EdgeInsets.all(5.0), builder: DotSwiperPaginationBuilder(size: 7)),
            itemCount: 3,
          ),
          constraints: BoxConstraints.loose(new Size(MediaQuery.of(context).size.width, 200.0))),
    );
  }
}
