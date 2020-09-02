import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocs/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[_crearFondo(context), _loginForm(context)],
    ));
  }

  Widget _loginForm(context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(
              vertical: 50.0,
            ),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    spreadRadius: 3.0,
                    offset: Offset(0.0, 5.0))
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Ingreso',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 40),
                _crearEmail(bloc),
                SizedBox(height: 30),
                _crearPassword(bloc),
                SizedBox(height: 30),
                _crearBoton(bloc)
              ],
            ),
          ),
          Text('¿Contraseña olvidada?'),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo Electrónico',
                counterText: snapshot.data,
                errorText: snapshot.error,
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.deepPurple,
                )),
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(

                //  hintText: 'Contraseña',
                labelText: 'Password',
                counterText: snapshot.data,
                errorText: snapshot.error,
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.deepPurple,
                )),
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    //formValidStream

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          onPressed: snapshot.hasData
              ? () {
                  _login(bloc, context);
                }
              : null,
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
        );
      },
    );
  }

  _login(LoginBloc loginBloc, BuildContext context) {
    print('========================');
    print('email: ${loginBloc.email} \n');
    print('pw: ${loginBloc.password} ');
    print('========================');
    Navigator.pushReplacementNamed(context, 'home');
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0)
      ])),
    );
    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(
          child: circulo,
          top: 90.0,
          left: 30.0,
        ),
        Positioned(
          child: circulo,
          top: -40.0,
          right: -30.0,
        ),
        Positioned(
          child: circulo,
          bottom: -50.0,
          right: -10.0,
        ),
        Positioned(
          child: circulo,
          bottom: 120.0,
          right: 100.0,
        ),
        Positioned(
          child: circulo,
          bottom: 10.0,
          left: 130.0,
        ),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.person_pin_circle,
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'Ricardo Luna',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              )
            ],
          ),
        )
      ],
    );
  }
}
//Stream<bool> get formValidStream =>
//       Rx.combineLatest2(emailStream, passwStream, (e, p) => true);
