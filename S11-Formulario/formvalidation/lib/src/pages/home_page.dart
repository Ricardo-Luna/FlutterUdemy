import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocs/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Inicio')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Email: ${bloc.email}'),
            Text('Password: ${bloc.password}')
          ],
        ),
      ),
    );
  }
}
