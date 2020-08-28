import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  static final String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    prefs.pantalla = HomePage.routeName;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
          title: Text('Preferencias del Usuario'),
          centerTitle: true,
        ),
        drawer: MenuWidget(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Color secundario: ${prefs.colorSecundario}'),
            Divider(),
            Text('Género: ${prefs.genero}'),
            Divider(),
            Text('Nombre usuario: ${prefs.nombre}'),
            Divider(),
          ],
        ));
  }
}
