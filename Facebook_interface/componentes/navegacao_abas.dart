import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

class NavegacaoAbas extends StatelessWidget {

  final List<IconData> icones;
  final int indiceAbaSelecionada;
  final Function(int) onTap;
  final bool indicadorEmbaixo;

  NavegacaoAbas({
   required this.icones,
   required this.indiceAbaSelecionada,
   required this.onTap,
   this.indicadorEmbaixo = false
});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: onTap,
        indicator: BoxDecoration(
          border: indicadorEmbaixo
              ? Border(
                  bottom: BorderSide(
                      color: PaletaCores.azulFacebook,
                      width: 3
                  )
          )
              : Border(
                  top: BorderSide(
                      color: PaletaCores.azulFacebook,
                      width: 3
                  )
              ),
        ),
        tabs: icones.asMap().map((index, icone){
          return MapEntry(index, Tab(
            icon: Icon(
              icone,
              color: indiceAbaSelecionada == index ? PaletaCores.azulFacebook : Colors.black54,
              size: 30,
            ),
          ));
        }).values.toList()
    );
  }
}
