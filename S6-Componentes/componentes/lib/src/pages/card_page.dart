import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(
              "https://mir-s3-cdn-cf.behance.net/project_modules/fs/71362843971117.5803e2d15fa03.jpg",
              "Battlefield 1"),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(
              "https://cdn.shopify.com/s/files/1/0325/8499/0851/products/horizon-zero-dawn-1-cvr-b-game-art-wrap-titan-comics-920856.jpg?v=1594339411",
              "Horizon Zero Dawn"),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(
              "https://i.pinimg.com/originals/97/b0/a0/97b0a08b632359ef539063a715cfdce5.jpg",
              "Red Dead Redemption 2"),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blueGrey[700]),
            subtitle: Text(
                "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500"),
            title: Text("Título de tarjeta"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Aceptar'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2(url, title) {
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(url),
            placeholder: AssetImage('assets/ldn.gif'),
            fadeInDuration: Duration(milliseconds: 500),
            height: 250,
            fit: BoxFit.cover,
          ),
          //Image(
          //  image: NetworkImage(
          //      "https://gblade.staticmedia.ca/wp-content/uploads/2017/04/IMG_3030-1-e1497994148265.jpg"),
          //),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: card,
      ),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.red[400],
              blurRadius: 15.0,
              spreadRadius: 3.0,
              offset: Offset(10.0, 10.0)),
        ],
      ),
    );
  }
}
