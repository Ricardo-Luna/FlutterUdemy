import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scroll = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();
    _scroll.addListener(() {
      if (_scroll.position.pixels == _scroll.position.maxScrollExtent) {
        //_agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scroll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Icon(Icons.list),
          SizedBox(
            width: 20,
          ),
          Text("Listas")
        ]),
      ),
      body: Stack(children: <Widget>[_crearLista(), _footer()]),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPagina1,
      child: ListView.builder(
          controller: _scroll,
          itemCount: _listaNumeros.length,
          itemBuilder: (BuildContext context, int index) {
            final imagen = _listaNumeros[index];
            return FadeInImage(
              image: NetworkImage("https://picsum.photos/id/${imagen}/500/300"),
              placeholder: AssetImage('assets/ldn.gif'),
            );
          }),
    );
  }

  Future<Null> _obtenerPagina1() async {
    final duration = Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    new Timer(Duration(seconds: 2), respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scroll.animateTo(_scroll.position.pixels + 100,
        duration: Duration(microseconds: 250), curve: Curves.fastOutSlowIn);
    _agregar10();
  }

  Widget _footer() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
