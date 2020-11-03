import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;
  const ListaNoticias(this.noticias);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.noticias.length,
        itemBuilder: (BuildContext context, int index) {
          return _Noticia(
            noticia: this.noticias[index],
            index: index,
          );
          // return Text(this.noticias[index].title);
        });
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;
  const _Noticia({this.noticia, this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaTopBar(this.noticia, index),
        _TajertaTitulo(noticia),
        _TarjetaImagen(noticia),
        _TarjetaBody(noticia),
        _TarjetaBotones(),
        SizedBox(
          height: 10,
        ),
        Divider()
      ],

      /// child: Text(noticia.title),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;
  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}. ',
            style: TextStyle(color: miTema.accentColor),
          ),
          Text(
            '${noticia.source.name}. ',
            //style: TextStyle(color: miTema.accentColor),
          ),
        ],
      ),
    );
  }
}

class _TajertaTitulo extends StatelessWidget {
  final Article noticia;
  const _TajertaTitulo(this.noticia);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;
  const _TarjetaImagen(this.noticia);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (noticia.urlToImage != null)
                ? FadeInImage(
                    placeholder: AssetImage('assets/giphy.gif'),
                    image: NetworkImage(noticia.urlToImage))
                : Image(
                    image: AssetImage('assets/no-image.png'),
                  )),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;
  const _TarjetaBody(this.noticia);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((noticia.description != null) ? noticia.description : ''),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            fillColor: miTema.accentColor,
            child: Icon(Icons.star_border),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(
            width: 10,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            child: Icon(Icons.more),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          )
        ],
      ),
    );
  }
}
