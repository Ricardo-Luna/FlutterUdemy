import 'package:flutter/material.dart';
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class PeliculaDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _crearAppBar(pelicula),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(height: 10.0),
            _posterTitulo(pelicula, context),
            _descripcion(pelicula),
            _crearCasting(pelicula),
            // _descripcion(pelicula),
            // _descripcion(pelicula),
            // _descripcion(pelicula),
          ]),
        ),
      ],
    ));
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 210.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
            fit: BoxFit.fill,
            placeholder: AssetImage('assets/loading.gif'),
            fadeInDuration: Duration(milliseconds: 150),
            image: NetworkImage(pelicula.getBackgroundImg())),
      ),
    );
  }

  Widget _posterTitulo(Pelicula pelicula, BuildContext context) {
    return Hero(
      tag: pelicula.uniqueId,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterImg()),
                fit: BoxFit.fill,
                height: 150.0,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  pelicula.title,
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  pelicula.originalTitle,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(pelicula.voteAverage.toString())
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _descripcion(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _crearCasting(Pelicula pelicula) {
    final peliProvider = new PeliculasProvider();

    return FutureBuilder(
      future: peliProvider.getCast(pelicula.id.toString()),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _crearActoresPageView(snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearActoresPageView(List<Actor> actores) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.3, initialPage: 1),
        itemCount: actores.length,
        itemBuilder: (context, i) => _actorTarjeta(actores[i]),
      ),
    );
  }

  Widget _actorTarjeta(Actor actor) {
    return Container(
      child: Column(
        children: <Widget>[
          // Text(actor.character),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(actor.getFoto()),
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            '${actor.name} \n as \n ${actor.character}',
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
