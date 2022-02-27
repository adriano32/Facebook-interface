import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/componentes/imagem_perfil.dart';
import 'package:facebook_interface/modelos/modelos.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:facebook_interface/uteis/responsivo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:line_icons/line_icons.dart';

class CartaoPostagem extends StatelessWidget {

  final Postagem postagem;

  CartaoPostagem({
    required this.postagem
});

  @override
  Widget build(BuildContext context) {
    bool isDeskTop = Responsivo.isDeskTop(context);
    return Card(
      margin: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: isDeskTop ? 5 : 0
      ),
      elevation: isDeskTop ? 1 : 0,
      shape: isDeskTop
          ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      )
          : null
      ,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Cabeçalho
                  CabecalhoPostagem(
                      postagem: postagem
                  ),
                  //Descrição
                  Text(
                    postagem.descricao,
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
            //Postagem
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: CachedNetworkImage(imageUrl: postagem.urlImagem,),
            ),
            //Área de estatística
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: EstatiscaPostagem(postagem: postagem),
            )
          ],
        ),
      ),
    );
  }
}

class EstatiscaPostagem extends StatelessWidget {

  final Postagem postagem;

  EstatiscaPostagem({
    required this.postagem
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: PaletaCores.azulFacebook,
                shape: BoxShape.circle
              ),
              child: Icon(
                  Icons.thumb_up,
                  size: 10,
                  color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
                child: Text(
                  '${postagem.curtidas}',
                  style: TextStyle(
                      color: Colors.grey[600]
                  ),
                ),
            ),
            Text(
              '${postagem.comentarios} - comentários',
              style: TextStyle(
                  color: Colors.grey[600]
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              '${postagem.compartilhamentos} - compartilhamentos',
              style: TextStyle(
                  color: Colors.grey[600]
              ),
            )
          ],
        ),
        Divider(
          thickness: 1.2,
        ),
        Row(
          children: [
            BotaoPostagem(
                icone: Icon(
                  LineIcons.thumbsUpAlt,
                  color: Colors.grey[600],
                ),
                texto: 'Curtir',
                onTap: (){}
            ),
            BotaoPostagem(
                icone: Icon(
                  LineIcons.alternateCommentAlt,
                  color: Colors.grey[600],
                ),
                texto: 'Comentar',
                onTap: (){}
            ),
            BotaoPostagem(
                icone: Icon(
                  LineIcons.share,
                  color: Colors.grey[600],
                ),
                texto: 'Compartilhar',
                onTap: (){}
            ),
          ],
        )
      ],
    );
  }
}

class BotaoPostagem extends StatelessWidget {

  final Icon icone;
  final String texto;
  final VoidCallback onTap;

  BotaoPostagem({
    required this.icone,
    required this.texto,
    required this.onTap
});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: onTap,
            child: Container(
              child: Row(
                children: [
                  icone,
                  SizedBox(width: 4,),
                  Text(
                    texto,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}



class CabecalhoPostagem extends StatelessWidget {

  final Postagem postagem;

  CabecalhoPostagem({
    required this.postagem
});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagemPerfil(
            urlImagem: postagem.usuario.urlImagem,
            foiVisualizado: true,
        ),
        //Informações usuario
        SizedBox(
          width: 8,
        ),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  postagem.usuario.nome,
                  style: TextStyle(
                      color:Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${postagem.tempoAtras} - ',
                      style: TextStyle(
                        color:Colors.grey[500],
                      ),
                    ),
                    Icon(
                      Icons.public,
                      size: 15,
                      color: Colors.grey,
                    )
                  ],
                )
              ],
            ),
        ),

        IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_horiz)
        ),
      ],
    );
  }
}
