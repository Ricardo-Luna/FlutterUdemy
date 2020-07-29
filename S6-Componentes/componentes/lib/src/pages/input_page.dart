import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _correo = "";
  String _defaultOpt = "Volar";
  bool _obscureText = true;
  String _fecha = '';
  List<String> _poderes = ['Volar', 'Rayos', 'Super aliento', 'Fuerza'];
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearCorreo(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
          Divider(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Sólo es el nombre',
          suffixIcon: Icon(
            Icons.accessibility,
          ),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _crearCorreo() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //  counter: Text('Letras ${contador}'),
          hintText: 'Cuenta de correo',
          labelText: 'Correo',
          // helperText: 'Sólo es el nombre',
          suffixIcon: Icon(
            Icons.alternate_email,
          ),
          icon: Icon(Icons.email)),
      onChanged: (value) => setState(() {
        _correo = value;
        //contador = value.length;
      }),
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //  counter: Text('Letras ${contador}'),
          hintText: 'Contraseña',
          labelText: 'Contraseña',
          // helperText: 'Sólo es el nombre',
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.lock_open : Icons.lock_outline),
            onPressed: () {
              _toggle();
            },
          ),
          icon: Icon(Icons.lock)),
      onChanged: (value) => setState(() {
        _correo = value;
        //contador = value.length;
      }),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de Nacimiento',
          labelText: 'Fecha',
          suffixIcon: Icon(
            Icons.perm_contact_calendar,
          ),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2013),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'MX'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropDown() {
    return Row(children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30),
      Expanded(
        child: DropdownButton(
          value: _defaultOpt,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
              _defaultOpt = opt;
            });
          },
        ),
      ),
    ]);
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre: $_nombre"),
      subtitle: Text("Correo: $_correo"),
      trailing: Text(_defaultOpt),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
