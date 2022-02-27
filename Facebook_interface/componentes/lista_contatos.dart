import 'package:facebook_interface/componentes/botao_imagem_perfil.dart';
import 'package:facebook_interface/modelos/modelos.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatelessWidget {

  final List<Usuario> usuarios;

  ListaContatos({
    required this.usuarios
});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contatos',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]
                  ),
                ),
              ),
              IconButton(
                  onPressed: (){},
                  color: Colors.grey[700],
                  icon: Icon(Icons.video_call)
              ),
              IconButton(
                  onPressed: (){},
                  color: Colors.grey[700],
                  icon: Icon(Icons.search)
              ),
              IconButton(
                  onPressed: (){},
                  color: Colors.grey[700],
                  icon: Icon(Icons.more_horiz)
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  itemCount: usuarios.length,
                  itemBuilder: (context, index){

                    Usuario usuario = usuarios[index];

                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: BotaoImagemPerfil(
                            usuario: usuario,
                            onTap: (){}
                        ),
                    );
                  }
              )
          )
        ],
      )
    );
  }
}
