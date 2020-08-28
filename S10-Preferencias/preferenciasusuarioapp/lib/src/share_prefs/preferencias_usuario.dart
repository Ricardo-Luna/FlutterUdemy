import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();
  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();
  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  get nombre {
    return _prefs.getString('nombre') ?? "";
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  get pantalla {
    return _prefs.getString('pantalla') ?? 'home';
  }

  set pantalla(String value) {
    _prefs.setString('pantalla', value);
  }
}
// bool _colorSecundario;
// int _genero;
// String _nombre;
