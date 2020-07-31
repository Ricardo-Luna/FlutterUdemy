import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apiKey = '2c5fcd15bc6f3ed1a4563f2715519c95';
  String _url = 'api.themoviedb.org';
  String _language = 'en';
  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final respuesta = await http.get(url);
    final decodedData = json.decode(respuesta.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    return peliculas.items;
  }
  //Future<List<Pelicula>> getPopulares() async {
  //  final url = Uri.https(
  //      _url, '3/movie/popular', {'api_key': _apiKey, 'language': _language});
//
  //  final respuesta = await http.get(url);
  //  final decodedData = json.decode(respuesta.body);
//
  //  final peliculas = new Peliculas.fromJsonList(decodedData['results']);
  //  // print(peliculas.items[0].title);
//
  //  return peliculas.items;
  //}

  Future<List<Pelicula>> getMoviesRequest(urlPassed) async {
    final url =
        Uri.https(_url, urlPassed, {'api_key': _apiKey, 'language': _language});
    return await _procesarRespuesta(url);
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
