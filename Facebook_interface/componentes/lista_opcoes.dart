import 'package:facebook_interface/componentes/botao_imagem_perfil.dart';
import 'package:facebook_interface/modelos/modelos.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ListaOpcoes extends StatelessWidget {

  final Usuario usuario;

  final List<List> _opcoes = const [
    [LineIcons.userFriends, PaletaCores.azulFacebook, 'Amigos'],
    [LineIcons.facebookMessenger, PaletaCores.azulFacebook, 'Mensagens'],
    [LineIcons.flag, Colors.orange, 'Páginas'],
    [LineIcons.users, PaletaCores.azulFacebook, 'Grupos'],
    [Icons.storefront_outlined, PaletaCores.azulFacebook, 'Marketplace'],
    [Icons.ondemand_video, Colors.red, 'Assistir'],
    [LineIcons.calendar, Colors.deepPurple, 'Eventos'],
    [LineIcons.chevronCircleDown, Colors.black45, 'Ver mais']
  ];

  ListaOpcoes({
    required this.usuario
});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 6),
          itemCount: 1 + _opcoes.length,
          itemBuilder: (context, index){

            if(index == 0){

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: BotaoImagemPerfil(
                  usuario: usuario,
                  onTap: (){},
                ),
              );
            }

            List item = _opcoes[index - 1];

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Opcao(
                  icone: item[0],
                  cor: item[1],
                  texto: item[2],
                  onTap: (){}
              ),
            );
          }
      ),
    );
  }
}

class Opcao extends StatelessWidget {

  final IconData icone;
  final Color cor;
  final String texto;
  final VoidCallback onTap;

  Opcao({
   required this.icone,
   required this.cor,
   required this.texto,
   required this.onTap
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icone, color: cor, size: 35,),
          SizedBox(width: 4,),
          Flexible(
            child: Text(
              texto,
              style: TextStyle(
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}

