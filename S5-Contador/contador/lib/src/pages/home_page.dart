import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextStyle estiloTexto = new TextStyle(fontSize: 24.0);
  final conteo = 10;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Título'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Número de clicks:',
              style: estiloTexto,
            ),
            Text(
              '$conteo',
              style: estiloTexto,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}
