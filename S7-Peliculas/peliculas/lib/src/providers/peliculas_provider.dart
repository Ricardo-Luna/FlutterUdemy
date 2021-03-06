import 'dart:async';
import 'dart:convert';

import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apiKey = '2c5fcd15bc6f3ed1a4563f2715519c95';
  String _url = 'api.themoviedb.org';
  String _language = 'en';
  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = new List();
  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final respuesta = await http.get(url);
    final decodedData = json.decode(respuesta.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    return peliculas.items;
  }

  Future<List<Pelicula>> getPopulares() async {
    if (_cargando) return [];
    _cargando = true;
    _popularesPage++;
    print('Cargando');
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    final respuesta = await _procesarRespuesta(url);
    _populares.addAll(respuesta);
    popularesSink(_populares);
    _cargando = false;
    return respuesta;
    //final decodedData = json.decode(respuesta.body);
    //final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    //// print(peliculas.items[0].title);
    //return peliculas.items;
  }

  Future<List<Pelicula>> getMoviesRequest(urlPassed) async {
    final url =
        Uri.https(_url, urlPassed, {'api_key': _apiKey, 'language': _language});
    return await _procesarRespuesta(url);
  }

  Future<List<Actor>> getCast(String peliId) async {
    final url = Uri.https(_url, '3/movie/$peliId/credits',
        {'api_key': _apiKey, 'language': _language});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cast = new Cast.fromJsonList(decodedData['cast']);
    return cast.actores;
  }

  Future<List<Pelicula>> buscarPelicula(String query) async {
    final url = Uri.https(_url, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query});
    return _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getSimilares(String idPelicula) async {
    final url = Uri.https(_url, '3/movie/$idPelicula/similar',
        {'api_key': _apiKey, 'language': _language, 'movie_id': idPelicula});
    return _procesarRespuesta(url);
  }

  //Future<List<Pelicula>> getEnCines() async {
  //  final url = Uri.https(_url, '3/movie/now_playing',
  //      {'api_key': _apiKey, 'language': _language});

  //  final respuesta = await http.get(url);
  //  final decodedData = json.decode(respuesta.body);

  //  final peliculas = new Peliculas.fromJsonList(decodedData['results']);
  //  //print(peliculas.items[1].title);

  //  return peliculas.items;
  //}
}
