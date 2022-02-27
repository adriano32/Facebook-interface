import 'package:facebook_interface/modelos/usuario.dart';

class Story {

  Usuario usuario;
  String urlImagem;
  bool foiVisualizado;

  Story({
    required this.usuario,
    required this.urlImagem,
    this.foiVisualizado = false
});

}