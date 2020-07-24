import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final TextStyle _estiloTexto = new TextStyle(fontSize: 24.0);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('StatefulWidget'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Número de taps:',
                style: _estiloTexto,
              ),
              Text(
                '$_conteo',
                style: _estiloTexto,
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _crearBotones());
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: 25.0,
        ),
        FloatingActionButton(
          child: Icon(Icons.exposure_zero),
          onPressed: () {
            _reiniciar();
          },
        ),
        Expanded(
          child: SizedBox(
            width: 5.0,
          ),
        ),
        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: () {
            if (_conteo > 0) {
              _quitar();
            }
          },
        ),
        SizedBox(
          width: 15.0,
        ),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _agregar();
          },
        ),
        SizedBox(
          width: 5.0,
        ),
      ],
    );
  }

  void _agregar() {
    setState(() => _conteo++);
  }

  void _quitar() {
    setState(() => _conteo--);
  }

  void _reiniciar() {
    setState(() => _conteo = 0);
  }
}

/*
FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _conteo++;
          });
        },
      ),
*/
