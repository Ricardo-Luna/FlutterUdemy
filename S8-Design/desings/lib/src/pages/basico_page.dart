import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 18.0, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: _crearBody(),
    ));
  }

  Widget _crearBody() {
    return Column(
      children: <Widget>[
        _crearImagen(),
        _crearTitulo(),
        _crearAcciones(),
        _crearTexto(),
        _crearTexto(),
        _crearTexto(),
        _crearTexto(),
      ],
    );
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://i0.wp.com/noellembrooks.com/wp-content/uploads/2013/03/skyrim-landscape-34.png?fit=1920%2C1080&ssl=1')),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "High Hrothgar",
                    style: estiloTitulo,
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    'Skyrim, Tamriel',
                    style: estiloSubtitulo,
                  )
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30.0,
            ),
            Text('41', style: TextStyle(fontSize: 20.0))
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'SHARE')
      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blueAccent,
          size: 40.0,
        ),
        SizedBox(height: 7.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.blue),
        )
      ],
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Text(
          'Laboris aliqua elit voluptate ad sunt ipsum veniam. Lorem aliquip do est aliquip ea eu ex ad. Consequat adipisicing quis officia duis ex culpa culpa aute eiusmod officia aliquip exercitation in. Lorem enim officia excepteur ipsum nisi.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

//
}
