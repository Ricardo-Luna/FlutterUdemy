import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Películas en cines"),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        body: Container(
          child: Column(
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _swiperTarjetas(),
              _footer(context),
            ],
          ),
        ));
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getMoviesRequest('3/movie/now_playing'),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        return snapshot.hasData
            ? CardSwiper(peliculas: snapshot.data)
            : Container(
                height: 400.0,
                child: Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('Populares',
                    style: Theme.of(context).textTheme.subtitle1)),
            SizedBox(
              height: 5.0,
            ),
            FutureBuilder(
              future: peliculasProvider.getMoviesRequest('3/movie/popular'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //  snapshot.data?.forEach((p) => {print(p.title)});
                return snapshot.hasData
                    ? MovieHorizontal(peliculas: snapshot.data)
                    : Container(
                        height: 400.0,
                        child: Center(child: CircularProgressIndicator()));
              },
            ),
          ],
        ),
        width: double.infinity);
  }
}
