import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic> peliculas;
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemHeight: _screenSize.height * 0.5,
        itemWidth: _screenSize.width * 0.7,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  fit: BoxFit.cover,
                  image: NetworkImage(peliculas[index].getPosterImg())));
        },
        itemCount: peliculas.length,

        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
        // itemHeight: 200.0,
      ),
    );
  }
}
