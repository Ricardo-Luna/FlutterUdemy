import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  final peliculasProvider = new PeliculasProvider();
  final peliculas = [
    'Trainspotting',
    'Trainspotting 2',
    'Trainspotting 3',
    'Django',
    'The Gentlemen',
    'Taxi Driver'
  ];
  final pelicuasRecientes = ['Spiderman', 'Captain America', 'Trainspotting'];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Builder de los resultados a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias que la persona escribe
    if (query.isEmpty) {
      return Container();
    }
    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          final peliculas = snapshot.data;
          return ListView(
            children: peliculas.map((pelicula) {
              pelicula.uniqueId = '${pelicula.id}-busqueda';
              return ListTile(
                leading: Hero(
                  tag: pelicula.uniqueId,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(pelicula.getPosterImg()),
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: () {
                  close(context, null);
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                },
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // Sugerencias que la persona escribe
  //   final listaSugerida = (query.isEmpty)
  //       ? pelicuasRecientes
  //       : peliculas
  //           .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
  //           .toList();
//
  //   return ListView.builder(
  //       itemCount: listaSugerida.length,
  //       itemBuilder: (context, i) {
  //         return ListTile(
  //           leading: Icon(Icons.movie),
  //           title: Text(listaSugerida[i]),
  //           onTap: () {
  //             seleccion = listaSugerida[i];
  //             showResults(context);
  //           },
  //         );
  //       });
  // }
}
