import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Swiper(
        //   itemBuilder: (BuildContext context, int index) {
        //     return new Image.network(
        //       "http://via.placeholder.com/350x150",
        //       fit: BoxFit.fill,
        //     );
        //   },
        //   itemCount: 3,
        //   pagination: new SwiperPagination(),
        //   control: new SwiperControl(),
        // ),
        ListView(
          children: [Text("aaaaaaaaaaa"), Text("aaaaaaaaaaa"), Text("aaaaaaaaaaa"), Text("aaaaaaaaaaa")],
        )
      ],
    );
  }
}
