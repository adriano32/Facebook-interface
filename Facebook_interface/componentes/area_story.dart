import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/componentes/imagem_perfil.dart';
import 'package:facebook_interface/dados/dados.dart';
import 'package:facebook_interface/modelos/story.dart';
import 'package:facebook_interface/modelos/usuario.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:facebook_interface/uteis/responsivo.dart';
import 'package:flutter/material.dart';


class AreaStory extends StatelessWidget {

  final Usuario usuario;
  final List<Story> story;

  AreaStory({
    required this.usuario,
    required this.story
  });

  @override
  Widget build(BuildContext context) {
    bool isDeskTop = Responsivo.isDeskTop(context);
    return Container(
      height: 200,
      color: isDeskTop ? Colors.transparent : Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + story.length,
          itemBuilder: (context, index){

            if(index == 0){

              Story storyUsuario = Story(
                  usuario: usuarioAtual,
                  urlImagem: usuarioAtual.urlImagem
              );

              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 4
                ),
                child: CartaoStory(
                    story: storyUsuario,
                    adicionarStory: true,
                ),
              );
            }

            Story stories = story[index - 1];

            return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 4
                ),
                child: CartaoStory(
                    story: stories
                ),
            );
          }
      ),
    );
  }
}

class CartaoStory extends StatelessWidget {

  final Story story;
  final bool adicionarStory;

  CartaoStory({
   required this.story,
   this.adicionarStory = false
});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: story.urlImagem,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: PaletaCores.degradeStory,
            borderRadius: BorderRadius.circular(12)
          ),
        ),
        Positioned(
            top: 8,
            left: 8,
            child: adicionarStory
                ?
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                      icon: Icon(Icons.add),
                      iconSize: 30,
                      color: PaletaCores.azulFacebook,
                    ),
                  )
                :
                ImagemPerfil(
                    urlImagem: story.usuario.urlImagem,
                    foiVisualizado: story.foiVisualizado,
                )
        ),
        Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
                adicionarStory ? 'Criar Story' : story.usuario.nome,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
        )
      ],
    );
  }
}
