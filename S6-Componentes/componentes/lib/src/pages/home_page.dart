import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';

import 'package:componentes/src/providers/menu_provider.dart';

import 'package:componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //  print(menuProvider.opciones);
    //menuProvider.cargarData().then((opciones) {
    //  print('_lista');
    //  print(opciones);
    //});
    //return ListView(
    //  children: _crearListaItems(),
    //);
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        // print('__Builder__');
        // print(snapshot.data);
        return ListView(
          children: _crearListaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _crearListaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue[400]),
        onTap: () {
          //Cambiar de ruta dinámica
          Navigator.pushNamed(context, opt['ruta']);

          //Cambiar de página estática
          //final route = MaterialPageRoute(builder: (context) => AlertPage());
          //Navigator.push(context, route);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
}
